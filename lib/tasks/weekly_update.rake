require 'csv'
require 'date'

task weeklyupdate: :environment do
  # if Date.today.wday.zero?
  uids = Trail.all.limit(15).pluck(:uid)
  until uids.empty?
    ten = uids.shift(10).join(',')
    response = Faraday.get("https://www.hikingproject.com/data/get-trails-by-id?ids=#{ten}&key=#{ENV["HIKING_PROJECT_KEY"]}")
    trails = JSON.parse(response.body, symbolize_names: true)
    trails[:trails].each do |trail|
      trail_to_update = Trail.find_by(uid: trail[:id])
      puts "first #{trail_to_update.status}"
      trail_to_update.update(status: trail[:conditionStatus])
      puts "second #{trail_to_update.status}"
      trail_to_update.save!
    end
  end
end
