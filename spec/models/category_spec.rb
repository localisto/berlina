require 'spec_helper'

describe Category do
  describe "associations" do
    it { should have_many(:organizations).dependent(:nullify) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
