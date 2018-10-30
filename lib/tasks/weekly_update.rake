require 'csv'
require 'date'

task weeklyupdate: :environment do
  TrailWorker.perform_async
end
