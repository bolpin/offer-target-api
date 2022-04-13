require 'rubygems/version'
require 'utils'

class Device < ApplicationRecord
  include Utils

  belongs_to :player
  belongs_to :operating_system
  belongs_to :locale

  validates :os_major_version,
    presence: true,
    numericality: { only_integer: true }
  validates :os_minor_version,
    presence: true,
    numericality: { only_integer: true }
  validates :os_patch_version,
    presence: true,
    numericality: { only_integer: true }

  def os_version
    [os_major_version, os_minor_version, os_patch_version].compact.join('.')
  end

  # converts '5' => '5.0.0' and stores each of the three
  # segments in an integer column, for sorting in the db
  def os_version=(str)
    self.os_major_version,
      self.os_minor_version,
      self.os_patch_version = parse_vers(str)
  rescue
    self.os_major_version =
      self.os_minor_version =
      self.os_patch_version = nil
  end

  scope :gr_eq_to_vers, ->(segments) {
    major,minor,patch = segments
    where("os_major_version > ? OR
           (os_major_version = ? AND os_minor_version > ?) OR
           (os_major_version = ? AND
            os_minor_version = ? AND
            os_patch_version >= ?)",
           major, major, minor, major, minor, patch)
  }

  scope :ls_eq_to_vers, ->(segments) {
    major,minor,patch = segments
    where("os_major_version < ? OR
           (os_major_version = ? AND os_minor_version < ?) OR
           (os_major_version = ? AND
            os_minor_version = ? AND
            os_patch_version <= ?)",
           major, major, minor, major, minor, patch)
  }

  scope :with_os, ->(os) {
    joins(:operating_system).where(
      operating_systems: { name: os }
    )
  }

  scope :with_locale, ->(code) {
    joins(:locale).where(
      locales: { code: code }
    )
  }

end
