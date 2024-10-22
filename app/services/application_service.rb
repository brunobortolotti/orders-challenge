# frozen_string_literal: true

class ApplicationService
  attr_reader :errors

  def self.call(...)
    new(...).execute

    self
  end

  def initialize(...)
    @errors = []
  end

  def execute; end
end