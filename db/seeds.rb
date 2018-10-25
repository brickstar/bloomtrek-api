rhps = ReiHikingProjectService.new

park_1 = Park.create!(name:"Castlewood Canyon", latitude: 39.3379, longitude: -104.7512)

rhps.trails(park_1.latitude, park_1.longitude)[:trails].each do |trail|
  park_1.trails.from_api(trail)
end

# lots of missing images here - maybe we should just remove?
# custer_county = Park.create!(name:"Custer County", latitude: 38.1072, longitude: -105.3543)
#
# rhps.trails(custer_county.latitude, custer_county.longitude)[:trails].each do |trail|
#   custer_county.trails.from_api(trail)
# end

deer_creek_canyon = Park.create!(name:"Deer Creek Canyon", latitude: 39.5420, longitude: -105.1491)

rhps.trails(deer_creek_canyon.latitude, deer_creek_canyon.longitude)[:trails].each do |trail|
  deer_creek_canyon.trails.from_api(trail)
end

golden_gate_canyon = Park.create!(name:"Golden Gate Canyon State Park", latitude: 39.8508, longitude: -105.4220)

rhps.trails(golden_gate_canyon.latitude, golden_gate_canyon.longitude)[:trails].each do |trail|
  golden_gate_canyon.trails.from_api(trail)
end

guanella_pass = Park.create!(name:"Guanella Pass", latitude: 39.6251, longitude: -105.7127)

rhps.trails(guanella_pass.latitude, guanella_pass.longitude)[:trails].each do |trail|
  guanella_pass.trails.from_api(trail)
end

hayden_park = Park.create!(name:"Hayden Park on Green Mountain", latitude: 39.6989, longitude: -105.1941)

rhps.trails(hayden_park.latitude, hayden_park.longitude)[:trails].each do |trail|
  hayden_park.trails.from_api(trail)
end

lair_o_the_bair = Park.create!(name:"Lair O' the Bear Open Space Park", latitude: 39.6678, longitude: -105.2575)

rhps.trails(lair_o_the_bair.latitude, lair_o_the_bair.longitude)[:trails].each do |trail|
  lair_o_the_bair.trails.from_api(trail)
end

lookout_mountain = Park.create!(name:"Lookout Mountain Nature Center", latitude: 39.7306, longitude: -105.2481)

rhps.trails(lookout_mountain.latitude, lookout_mountain.longitude)[:trails].each do |trail|
  lookout_mountain.trails.from_api(trail)
end

loveland_pass = Park.create!(name:"Loveland Pass", latitude: 39.6718, longitude: -105.8402)

rhps.trails(loveland_pass.latitude, loveland_pass.longitude)[:trails].each do |trail|
  loveland_pass.trails.from_api(trail)
end

maloit = Park.create!(name:"Maloit Park", latitude: 39.5647, longitude: -106.4139)

rhps.trails(maloit.latitude, maloit.longitude)[:trails].each do |trail|
  maloit.trails.from_api(trail)
end

mesa_county = Park.create!(name:"Mesa County", latitude: 39.0589, longitude: -108.5659)

rhps.trails(mesa_county.latitude, mesa_county.longitude)[:trails].each do |trail|
  mesa_county.trails.from_api(trail)
end

mount_falcon = Park.create!(name:"Mount Falcon", latitude: 39.6360, longitude: -105.2394)

rhps.trails(mount_falcon.latitude, mount_falcon.longitude)[:trails].each do |trail|
  mount_falcon.trails.from_api(trail)
end

no_name_creek = Park.create!(name:"No Name Creek", latitude: 39.3405, longitude: -107.1734)

rhps.trails(no_name_creek.latitude, no_name_creek.longitude)[:trails].each do |trail|
  no_name_creek.trails.from_api(trail)
end

plains_conservation_center = Park.create!(name:"Plains Conservation Center", latitude: 39.6558, longitude: -104.7366)

rhps.trails(plains_conservation_center.latitude, plains_conservation_center.longitude)[:trails].each do |trail|
  plains_conservation_center.trails.from_api(trail)
end

reynolds_open_space = Park.create!(name:"Reynolds Open Space", latitude: 39.4617, longitude: -105.2305)

rhps.trails(reynolds_open_space.latitude, reynolds_open_space.longitude)[:trails].each do |trail|
  reynolds_open_space.trails.from_api(trail)
end

roxborough_state_park = Park.create!(name:"Roxborough State Park", latitude: 39.4289, longitude: -105.0681)

rhps.trails(roxborough_state_park.latitude, roxborough_state_park.longitude)[:trails].each do |trail|
  roxborough_state_park.trails.from_api(trail)
end

south_platte_park = Park.create!(name:"South Platte Park", latitude: 39.5830, longitude: -105.0289)

rhps.trails(south_platte_park.latitude, south_platte_park.longitude)[:trails].each do |trail|
  south_platte_park.trails.from_api(trail)
end

south_valley_open_space = Park.create!(name:"South Valley Open Space", latitude: 39.5657, longitude: -105.1529)

rhps.trails(south_valley_open_space.latitude, south_valley_open_space.longitude)[:trails].each do |trail|
  south_valley_open_space.trails.from_api(trail)
end

teller_county = Park.create!(name:"Teller County", latitude: 38.9111, longitude: -105.0518)

rhps.trails(teller_county.latitude, teller_county.longitude)[:trails].each do |trail|
  teller_county.trails.from_api(trail)
end

vail_nature_center = Park.create!(name:"Vail Nature Center", latitude: 39.6396, longitude:  -106.3627)

rhps.trails(vail_nature_center.latitude, vail_nature_center.longitude)[:trails].each do |trail|
  vail_nature_center.trails.from_api(trail)
end
