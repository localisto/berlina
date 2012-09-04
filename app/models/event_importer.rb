class EventImporter
  require 'json'
  require 'open-uri'

  URI = "https://data.seattle.gov/api/views/8pec-7ugc/rows.json?accessType=DOWNLOAD"

  class << self
    def import
      json = JSON.parse(open(URI).read)
      json["data"].each do |row|
        event = Event.find_or_initialize_by_external_id(row[1])
        event.name = row[8]
        event.start_time = row[9]
        event.end_time = row[10]
        #event.venue = row[11]
        #event.venue_extra = row[12]
        #event.address = row[13]
        #event.contact = row[14]
        #event.contact_position = row[15]
        #event.contact_phone = row[16]
        #event.contact_email = row[17]
        #event.latitude = row[18]
        #event.longitude = row[19]

        event.save
      end
    end
  end
end