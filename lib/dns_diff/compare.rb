# frozen_string_literal: true

module DnsDiff
  POSITIVE_MARK = "\u{2713}".colorize(:green)
  NEGATIVE_MARK = "\u{2717}".colorize(:red)

  class Compare
    def initialize(ns_a, ns_b, record_file, verbose:)
      @nameservers = [ns_a, ns_b]
      @verbose = verbose

      @resolv_a = Resolv::DNS.new(nameserver: ns_a)
      @resolv_b = Resolv::DNS.new(nameserver: ns_b)

      @record_file = File.open(record_file, 'r+')
    end

    def execute
      puts "Comparing #{@nameservers * ' vs '}"

      @record_file.each_line do |line|
        type, host = line.chomp.split(' ')

        compare_records type.upcase, host
      end
    end

    private

    def compare_records(type, host)
      type_class = Resolv::DNS::Resource::IN.const_get(type)

      res_a = DnsDiff::Resources.new(@resolv_a.getresources(host, type_class))
      res_b = DnsDiff::Resources.new(@resolv_b.getresources(host, type_class))

      print "Querying #{type.upcase} for #{host}... "

      if (res_a <=> res_b).zero?
        print "#{POSITIVE_MARK} (#{res_a.resource_names.size})\n"

        puts "\tboth returned #{res_a.resource_names}" if @verbose
      else
        print "#{NEGATIVE_MARK}\n"
        puts "\t#{@nameservers[0]} returned #{res_a.resource_names}"
        puts "\t#{@nameservers[1]} returned #{res_b.resource_names}"
      end
    end
  end
end
