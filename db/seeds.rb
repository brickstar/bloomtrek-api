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
# Maloit Park                 39.5647 / -106.4139
# Mesa County                 39.0589 / -108.5659
#
# Mount Falcon Open Space Park        39.6360 / -105.2394
# No Name Creek               39.3405 / -107.1734
# Plains Conservation Center   39.6558 / -104.7366
#
# Reynolds Open Space Park     39.4617 / -105.2305
# Roxborough State Park   39.4289 / -105.0681
# South Platte Park   39.5830 / 105.0289
# South Valley Open Space Park    39.5657 / 105.152944
# Teller County       38.9111 / 105.0518
# Vail Nature Center      39.6396 / 106.3627
