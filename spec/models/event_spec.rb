require 'spec_helper'

describe Event do
  describe "associations" do
    it { should belong_to :organization }
  end

  describe "validations" do
    it { should validate_presence_of :external_id }
    it { should validate_uniqueness_of :external_id }
    it { should validate_presence_of :organization }
    it { should validate_presence_of :start_time }
  end
end
