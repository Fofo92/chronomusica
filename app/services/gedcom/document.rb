module Gedcom
  class Document
    attr_reader :individuals

    def initialize(individuals:)
      @individuals = individuals
    end
  end
end
