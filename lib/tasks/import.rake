namespace :import do
  desc "Import events from data.seattle.gov"
  task :events => :environment do
    EventImporter.import
  end
end