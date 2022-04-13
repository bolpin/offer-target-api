class Player < ApplicationRecord

  has_one :device
  belongs_to :gender

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthdate, presence: true

  accepts_nested_attributes_for :device,
    # allow_destroy: true,
    reject_if: proc { |attributes| false }

  validate :minimum_fourteen_years_old

  def minimum_fourteen_years_old
    if self.birthdate && self.birthdate > 14.years.ago.to_date
      errors.add(:birthdate, "player too young")
    end
  end

  scope :with_birthdate_in_range, ->(date_range) {
    where(birthdate: date_range)
  }

  def age
    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end

  def Player.all_matching_target_offer(target)

    Player.find_by_sql("
      SELECT * FROM players WHERE
      id IN (
        SELECT d.player_id FROM devices d
        WHERE d.player_id IN
        (
          SELECT p.id
          FROM players p WHERE
            p.gender_id = #{target.gender_id} AND
            p.birthdate BETWEEN
              CURRENT_DATE - INTERVAL '1 year' * #{target.max_player_age} AND
              CURRENT_DATE - INTERVAL '1 year' * #{target.min_player_age}
        )
        AND
        d.locale_id = #{target.locale_id} AND
        d.operating_system_id = #{target.operating_system_id} AND
        (
          (d.os_major_version > #{target.min_os_major_version})
          OR
          (d.os_major_version = #{target.min_os_major_version} AND
            d.os_minor_version > #{target.min_os_minor_version})
          OR
          (d.os_major_version = #{target.min_os_major_version} AND
            d.os_minor_version = #{target.min_os_minor_version} AND
            d.os_patch_version >= #{target.min_os_patch_version})
        )
    );
    ")
  end

end
