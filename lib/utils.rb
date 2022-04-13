require 'rubygems/version'

module Utils

  # Returns array of three segments (maj, minor, patch)
  # NOTE: pre-release suffixes are ignored
  def parse_vers(version_str)
    segments = Gem::Version.new(version_str).release.segments
    while segments.length < 3
      segments.push 0
    end
    segments
  end

end

