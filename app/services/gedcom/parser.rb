module Gedcom
  class Parser
    LINE_PATTERN =
      /\A(?<level>\d+)\s+(?:(?<xref>@[^@]+@)\s+)?(?<tag>[A-Za-z0-9_]+)(?:\s+(?<value>.*))?\z/

    def self.parse(path)
      new(path).parse
    end

    private_class_method :new

    def initialize(path)
      @path = Pathname(path)
    end

    def parse
      root_nodes = []
      stack = []

      File.foreach(path, chomp: true) do |line|
        node = parse_line(line)
        next unless node

        stack.pop while stack.any? && stack.last.level >= node.level

        if stack.empty?
          root_nodes << node
        else
          stack.last.add_child(node)
        end

        stack << node
      end

      Document.new(
        individuals: root_nodes.select { |node| node.tag == "INDI" }
      )
    end

    private

    attr_reader :path

    def parse_line(line)
      match = LINE_PATTERN.match(line)
      return unless match

      Node.new(
        level: Integer(match[:level]),
        xref: match[:xref],
        tag: match[:tag],
        value: match[:value]&.strip
      )
    end
  end
end
