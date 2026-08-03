module Gedcom
  class Parser
    INDIVIDUAL_PATTERN = /\A0\s+(?<xref>@[^@]+@)\s+INDI\z/

    def self.parse(path)
      new(path).parse
    end

    def initialize(path)
      @path = Pathname(path)
    end

    def parse
      individuals = File.foreach(path, chomp: true).filter_map do |line|
        build_individual(line)
      end

      Document.new(individuals: individuals)
    end

    private

    attr_reader :path

    def build_individual(line)
      match = INDIVIDUAL_PATTERN.match(line)
      return unless match

      Record.new(
        xref: match[:xref],
        tag: "INDI"
      )
    end
  end
end
