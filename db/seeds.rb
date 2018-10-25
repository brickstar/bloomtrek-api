rhps = ReiHikingProjectService.new

park_1 = Park.new(name:"Castlewood Canyon", latitude: 39.3379, longitude: -104.7512)

rhps.trails(park_1.latitude, park_1.longitude)[:trails].each do |trail|
  park_1.trails.from_api(trail)
end

# get("all this stuff from the internet based on park_1.lat and park_1.long").each do |trail|
#   park_1.trails.create(object_from_get_request)
# end


# Castlewood Canyon           39.3379 / -104.7512
# Custer County               38.1072 / -105.3543
#                                 38.1309 / -105.4638
# Deer Creek Canyon           39.5420 / -105.1491
# Golden Gate Canyon State Park      39.8508 / -105.4220
# Guanella Pass               39.6251 / -105.7127
# Hayden Park on Green Mountain       39.6989 / -105.1941
# High Plains ??
#
# Lair O’ the Bear Open Space Park  39.6678 / -105.2575
# Lookout Mountain Nature Center      39.7306 / -105.2481
#
# Loveland Pass               39.6718 / -105.8402

# -----------------------------------------------------
# Maloit Park                 39.5647 / -106.4139
maloit = Park.new(name:"Maloit Park", latitude: 39.5647, longitude: -106.4139)

rhps.trails(maloit.latitude, maloit.longitude)[:trails].each do |trail|
  maloit.trails.from_api(trail)
end

# Mesa County                 39.0589 / -108.5659
mesa_county = Park.new(name:"Mesa County", latitude: 39.0589, longitude: -108.5659)

rhps.trails(mesa_county.latitude, mesa_county.longitude)[:trails].each do |trail|
  mesa_county.trails.from_api(trail)
end

# Mount Falcon Open Space Park        39.6360 / -105.2394
mount_falcon = Park.new(name:"Mount Falcon", latitude: 39.6360, longitude: -105.2394)

rhps.trails(mount_falcon.latitude, mount_falcon.longitude)[:trails].each do |trail|
  mount_falcon.trails.from_api(trail)
end

# No Name Creek               39.3405 / -107.1734
no_name_creek = Park.new(name:"No Name Creek", latitude: 39.3405, longitude: -107.1734)

rhps.trails(no_name_creek.latitude, no_name_creek.longitude)[:trails].each do |trail|
  no_name_creek.trails.from_api(trail)
end

# Plains Conservation Center   39.6558 / -104.7366
plains_conservation_center = Park.new(name:"Plains Conservation Center", latitude: 39.6558, longitude: -104.7366)

rhps.trails(plains_conservation_center.latitude, plains_conservation_center.longitude)[:trails].each do |trail|
  plains_conservation_center.trails.from_api(trail)
end

# Reynolds Open Space Park     39.4617 / -105.2305

reynolds_open_space = Park.new(name:"Reynolds Open Space", latitude: 39.4617, longitude: -105.2305)

rhps.trails(reynolds_open_space.latitude, reynolds_open_space.longitude)[:trails].each do |trail|
  reynolds_open_space.trails.from_api(trail)
end

# Roxborough State Park   39.4289 / -105.0681

roxborough_state_park = Park.new(name:"Roxborough State Park", latitude: 39.4289, longitude: -105.0681)

rhps.trails(roxborough_state_park.latitude, roxborough_state_park.longitude)[:trails].each do |trail|
  roxborough_state_park.trails.from_api(trail)
end

# South Platte Park   39.5830 / -105.0289
south_platte_park = Park.new(name:"South Platte Park", latitude: 39.5830, longitude: -105.0289)

rhps.trails(south_platte_park.latitude, south_platte_park.longitude)[:trails].each do |trail|
  south_platte_park.trails.from_api(trail)
end

# South Valley Open Space    39.5657 / -105.1529
south_valley_open_space = Park.new(name:"South Valley Open Space", latitude: 39.5657, longitude: -105.1529)

rhps.trails(south_valley_open_space.latitude, south_valley_open_space.longitude)[:trails].each do |trail|
  south_valley_open_space.trails.from_api(trail)
end

# Teller County       38.9111 / -105.0518
teller_county = Park.new(name:"Teller County", latitude: 38.9111, longitude: -105.0518)

rhps.trails(teller_county.latitude, teller_county.longitude)[:trails].each do |trail|
  teller_county.trails.from_api(trail)
end

# Vail Nature Center      39.6396 / -106.3627
vail_nature_center = Park.new(name:"Vail Nature Center", latitude: 39.6396, longitude:  -106.3627)

rhps.trails(vail_nature_center.latitude, vail_nature_center.longitude)[:trails].each do |trail|
  vail_nature_center.trails.from_api(trail)
end
