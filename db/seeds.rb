require 'csv'

rhps = ReiHikingProjectService.new

Park.destroy_all
Trail.destroy_all
Flower.destroy_all

park_1 = Park.create!(name:"Castlewood Canyon", latitude: 39.3379, longitude: -104.7512)
deer_creek_canyon = Park.create!(name:"Deer Creek Canyon", latitude: 39.5420, longitude: -105.1491)
golden_gate_canyon = Park.create!(name:"Golden Gate Canyon State Park", latitude: 39.8508, longitude: -105.4220)
guanella_pass = Park.create!(name:"Guanella Pass", latitude: 39.6251, longitude: -105.7127)
hayden_park = Park.create!(name:"Hayden Park on Green Mountain", latitude: 39.6989, longitude: -105.1941)
lair_o_the_bair = Park.create!(name:"Lair O' the Bear Open Space Park", latitude: 39.6678, longitude: -105.2575)
lookout_mountain = Park.create!(name:"Lookout Mountain Nature Center", latitude: 39.7306, longitude: -105.2481)
loveland_pass = Park.create!(name:"Loveland Pass", latitude: 39.6718, longitude: -105.8402)
maloit = Park.create!(name:"Maloit Park", latitude: 39.5647, longitude: -106.4139)
mesa_county = Park.create!(name:"Mesa County", latitude: 39.0589, longitude: -108.5659)
mount_falcon = Park.create!(name:"Mount Falcon", latitude: 39.6360, longitude: -105.2394)
no_name_creek = Park.create!(name:"No Name Creek", latitude: 39.3405, longitude: -107.1734)
plains_conservation_center = Park.create!(name:"Plains Conservation Center", latitude: 39.6558, longitude: -104.7366)
reynolds_open_space = Park.create!(name:"Reynolds Open Space", latitude: 39.4617, longitude: -105.2305)
roxborough_state_park = Park.create!(name:"Roxborough State Park", latitude: 39.4289, longitude: -105.0681)
south_platte_park = Park.create!(name:"South Platte Park", latitude: 39.5830, longitude: -105.0289)
south_valley_open_space = Park.create!(name:"South Valley Open Space", latitude: 39.5657, longitude: -105.1529)
teller_county = Park.create!(name:"Teller County", latitude: 38.9111, longitude: -105.0518)
vail_nature_center = Park.create!(name:"Vail Nature Center", latitude: 39.6396, longitude:  -106.3627)

Park.all.each do |park|
  rhps.trails(park.latitude, park.longitude)[:trails].each do |trail|
    park.trails.from_api(trail)
  end
end

def seed_flower_data(csv_file, park)
  CSV.foreach("./#{csv_file}", headers: true, header_converters: :symbol) do |row|
    flower = Flower.find_or_create_by
                            (
                              flower_img_url: row[0],
                              name: row[1],
                              common_name: row[2],
                              scientific_name: row[3],
                              description: row[4],
                              bloom_start: row[5],
                              bloom_end: row[6],
                              habitat: row[7]
                            )
    ParkFlower.create(park_id: park.id, flower_id: flower.id)
  end
end

seed_flower_data("db/data/Castlewood_Canyon_flowers.csv", park_1)
seed_flower_data("db/data/Deer_Creek_Open_Space_Park_flowers.csv", deer_creek_canyon)
seed_flower_data("db/data/Golden_Gate_Canyon_flowers.csv", golden_gate_canyon)
seed_flower_data("db/data/Guanella_Pass_flowers.csv", guanella_pass)
seed_flower_data("db/data/Hayden_Park_on_Green_Mountain_flowers.csv", hayden_park)
seed_flower_data("db/data/Lair_O_the_Bear_flowers.csv", lair_o_the_bair)
seed_flower_data("db/data/Lookout_Mountain_Nature_Center_flowers.csv", lookout_mountain)
seed_flower_data("db/data/Loveland_Pass_flowers.csv", loveland_pass)
seed_flower_data("db/data/Maloit_Park_flowers.csv", maloit)
seed_flower_data("db/data/Mesa_County_flowers.csv", mesa_county)
seed_flower_data("db/data/Mount_Falcon_Open_SpacePark_flowers.csv", mount_falcon)
seed_flower_data("db/data/No_Name_Creek_flowers.csv", no_name_creek)
seed_flower_data("db/data/Plains_Conservation_Center_flowers.csv", plains_conservation_center)
seed_flower_data("db/data/Reynolds_Open_Space_Park_flowers.csv", reynolds_open_space)
seed_flower_data("db/data/Roxborough_State_Park_flowers.csv", roxborough_state_park)
seed_flower_data("db/data/South_Platte_Park_flowers.csv", south_platte_park)
seed_flower_data("db/data/South_Valley_Open_Space_Park_flowers.csv", south_valley_open_space)
seed_flower_data("db/data/Teller_County_flowers.csv", teller_county)
seed_flower_data("db/data/Vail_Nature_Center_flowers.csv", vail_nature_center)
