module ApplicationHelper
  include Twitter::Autolink

  def event_fields
    [:venue, :venue_extra, :contact_name, :contact_position, :contact_phone, :contact_email]
  end

  def map_image(event)
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{event.lat},#{event.lng}&markers=#{event.lat},#{event.lng}&zoom=16&size=400x400&sensor=false"
  end
end
