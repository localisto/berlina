require 'spec_helper'

describe Event do
  describe "validations" do
    it { should validate_presence_of :external_id }
    it { should validate_uniqueness_of :external_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_time }
  end
end
