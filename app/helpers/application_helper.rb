module ApplicationHelper
  def map_image(event)
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{event.lat},#{event.lng}&markers=#{event.lat},#{event.lng}&zoom=16&size=400x400&sensor=false"
  end
end
