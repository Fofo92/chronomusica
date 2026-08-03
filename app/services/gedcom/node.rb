module Gedcom
  class Node
    attr_reader :level, :xref, :tag, :value, :children

    def initialize(level:, tag:, xref: nil, value: nil)
      @level = level
      @xref = xref
      @tag = tag
      @value = value
      @children = []
    end

    def add_child(node)
      children << node
    end

    def child(tag)
      children.find { |node| node.tag == tag }
    end
  end
end
