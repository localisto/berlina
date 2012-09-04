require 'spec_helper'

describe Tweet do
  describe "associations" do
    it { should belong_to :twitter_user }
  end

  describe "validations" do
    it { should validate_presence_of :text }
    it { should validate_presence_of :external_id }
    it { should validate_uniqueness_of :external_id }
    it { should validate_presence_of :twitter_user }
  end
end
