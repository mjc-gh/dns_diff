# frozen_string_literal: true

module DnsDiff
  class CLI < Thor
    class_option :verbose, type: :boolean, desc: 'Verbose output'

    desc "compare NAMESERVER_A NAMESERVER_B RECORD_FILE", "say hello to NAME"
    def compare(*args)
      Compare.new(*args, verbose: options.fetch(:verbose) { false }).execute
    end
  end
end
