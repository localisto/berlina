require 'spec_helper'

describe Organization do
  describe "associations" do
    it { should have_many(:events).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
