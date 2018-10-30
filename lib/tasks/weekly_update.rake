require 'csv'
require 'date'

task weeklyupdate: :environment do
  if Date.today.wday == 1
    TrailWorker.perform_async
  end
end
