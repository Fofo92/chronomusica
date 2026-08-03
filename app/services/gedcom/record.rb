module Gedcom
  class Record
    attr_reader :xref, :tag

    def initialize(xref:, tag:)
      @xref = xref
      @tag = tag
    end
  end
end
