require 'spec_helper'

describe TwitterUser do
  describe "validations" do
    it { should validate_presence_of :external_id }
    it { should validate_uniqueness_of :external_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :profile_image_url }
  end
end
