require 'csv'
require 'date'

task weeklyupdate: :environment do
  rhps = ReiHikingProjectService.new
  # if Date.today.wday.zero?
  uids = Trail.all.pluck(:uid)
  until uids.empty?
    first_ten_trails = uids.shift(10).join(',')
    rhps.get_trails_by_id(first_ten_trails)[:trails].each do |trail|
      trail_to_update = Trail.find_by(uid: trail[:id])
      trail_to_update.update(status: trail[:conditionStatus])
      trail_to_update.save!
    end
  end
end
