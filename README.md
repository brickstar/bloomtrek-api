# README

### About

This is a restful JSON API that serves data on parks, trails, and their associated flowers in Colorado. Dataset is populated using data from the [Hiking project](https://www.hikingproject.com/) and the [CSU extension plant database](https://coloradoplants.jeffco.us/). The front end repo is located [here](https://github.com/laurakwhit/bloom-trek).

Deployed at:

#### [https://bloom-trek-api.herokuapp.com/api/v1](https://bloom-trek-api.herokuapp.com/api/v1)

Check out the [Swagger documentation](https://app.swaggerhub.com/apis-docs/BloomTrek/BloomTrek/1.0.0) for more information!

### Technology Used

* [Rails version: 5.2.0](https://rubyonrails.org/)
* [Ruby version: 2.4.3](https://www.ruby-lang.org/en/)
* [Sidekiq/Redis](https://sidekiq.org/)
* [Rspec/Capybara](http://rspec.info/documentation/)

### How to set up the API to run locally.

1. Clone this repo
    * `$ git clone https://github.com/brickstar/bloomtrek-api.git`

2. Run these commands:
    * `$ cd bloomtrek-api`
    * `$ bundle update`
    * `$ rake db:{drop,create,migrate,seed}`
   
    NOTE: Seeding WILL require an api key from the [Hiking project](https://www.hikingproject.com/data) (it's really easy to get and it's an awesome API!)
    
    * `$ rails s`
    * If you want to run a local test suite `$ rspec` otherwise you can open up `localhost:3000` in your browser and try a route!

 ## End Points

## End Points

1. `GET /api/v1/parks`

Returns all parks currently in the database

Each individual park will be returned in the following format:

```
{
	"id": 1,
	"name": "Castlewood Canyon",
	"coords": {
	"latitude": 39.3379,
	"longitude": -104.7512
	}
},
```

2. `GET /api/v1/parks/:id/trails`

Returns all trails associated/near park in the database.

Each trail will be returned in the following format:

```
{
	"id": 1,
	"name": "Castlewood Canyon - Rimrock to Creek Bottom Loop",
	"uid": 7006769,
	"difficulty": "medium",
	"length": 4.6,
	"status": "All Clear",
	"trail_img_url": "https://cdn-files.apstatic.com/hike/7006325_medium_1438452681.jpg",
	"trail_url": "https://www.hikingproject.com/trail/7006769/castlewood-canyon-rimrock-to-creek-bottom-loop",
	"summary": "A fun, rolling trail with a sense of seclusion, great geology, and historical sites.",
	"park_id": 1,
	"coords": {
		"latitude": 39.3598,
		"longitude": -104.7682
}
```

If the park can not be found a `404` will be returned.

3. `GET /api/v1/parks/:id/flowers?month=<integer>`

Returns all flowers currently in bloom associated/near park in the database.

Each flower will be returned in the following format:

```
{
	"id": 1,
	"flower_img_url": "http://extension.colostate.edu/county/jeffco/natural/plant_images/adenolinum_lewisii_1_378x400.jpg",
	"name": "Wild Blue Flax",
	"common_name": "Blue Flax",
	"scientific_name": "Adenolinum lewisii",
	"description": "Stigma capitate (headed); plant produces many branches from the base; styles of same length on different plants.",
	"bloom_start": 5,
	"bloom_end": 8,
	"habitat": "Dry slopes, forest clearings, roadsides."
},
```

If the park can not be found a `404` will be returned. 

*NOTE:* Sometimes flowers are not in bloom, so you may not get results. The integer value passed in represents the month (so 12 is December, sorry - no flowers in bloom in December).

4. `GET /api/v1/scraper?website=<website_name>&csv_file_name=<file_name>`

SPECIAL NOTE: This is an end point built to utilize a micro service built solely for scraping data from the CSU extension database. It will only accept web addresses from the plant database, like: `https://coloradoplants.jeffco.us/parksearch.do?name=12&parkname=Custer+County+`

The output is a CSV file with the scraped data! How neat is that! You can check out the API responsible for this scraping [here](https://github.com/KeeganCorrigan/bloomtrek_scraper). And it's deployed at: 

#### https://bloomtrek-api-scraper.herokuapp.com/

### Other notes:

Backend Developers: [Matt Bricker](https://github.com/brickstar) and [Keegan Corrigan](https://github.com/keegancorrigan/)

Frontend Developers: [Laura Whitaker](https://github.com/laurakwhit) and [Chris](https://github.com/chrisboylen)

-------

*somewhere i have never travelled,gladly beyond*

#### by e.e. cummings

somewhere i have never travelled,gladly beyond
any experience,your eyes have their silence:
in your most frail gesture are things which enclose me,
or which i cannot touch because they are too near

your slightest look easily will unclose me
though i have closed myself as fingers,
you open always petal by petal myself as Spring opens
(touching skilfully,mysteriously)her first rose

or if your wish be to close me,i and
my life will shut very beautifully,suddenly,
as when the heart of this flower imagines
the snow carefully everywhere descending;

nothing which we are to perceive in this world equals
the power of your intense fragility:whose texture
compels me with the colour of its countries,
rendering death and forever with each breathing

(i do not know what it is about you that closes
and opens;only something in me understands
the voice of your eyes is deeper than all roses)
nobody,not even the rain,has such small hands
