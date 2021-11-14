require 'colorize'
require 'thor'
require 'resolv'

require 'dns_diff/version'
require 'dns_diff/cli'
require 'dns_diff/compare'
require 'dns_diff/resources'

module DnsDiff
  class Error < StandardError; end
end
