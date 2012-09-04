require "spec_helper"

feature "events" do
  scenario "user views an event" do
    event = FactoryGirl.create(:event)
    visit event_path(event)
    [:name, :hashtag].each do |field|
      page.should have_content event.send(field)
    end
  end
end