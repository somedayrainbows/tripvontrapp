

admin = User.create(name: "admin", email: "admin@admin.com", password: "admin", role: 1)


user1 = User.create(name: "user1", email: "user1@user1.com", password: "user1", role: 0)
order1a = user1.orders.create(status: "Paid")
order1b = user1.orders.create(status: "Paid")
order1c = user1.orders.create(status: "Ordered")

user2 = User.create(name: "user2", email: "user2@user2.com", password: "user2", role: 0)
order2a = user2.orders.create(status: "Cancelled")
order2b = user2.orders.create(status: "Completed")

user3 = User.create(name: "user3", email: "user3@user3.com", password: "user3", role: 0)
order3a = user3.orders.create(status: "Paid")
order3b = user3.orders.create(status: "Completed")

user4 = User.create(name: "user4", email: "user4@user4.com", password: "user4", role: 0)
order4a = user4.orders.create(status: "Ordered")
order4b = user4.orders.create(status: "Paid")
order4c = user4.orders.create(status: "Completed")
order4d = user4.orders.create(status: "Cancelled")



city_life = Category.create(name: "City Life", image_path: "https://www.flairtradetravels.org/assets/city_life.jpg")
food_and_drink = Category.create(name: "Food and Drink", image_path: "https://www.flairtradetravels.org/assets/food_and_drink.jpg")
arts_and_culture = Category.create(name: "Arts and Culture", image_path: "https://www.flairtradetravels.org/assets/arts_and_culture_2.jpg")
great_outdoors = Category.create(name: "The Great Outdoors", image_path: "https://www.flairtradetravels.org/assets/great_outdoors.jpg")
active_adventures = Category.create(name: "Active Adventures", image_path: "https://www.flairtradetravels.org/assets/active_adventures.png")
family_friendly = Category.create(name: "Family Friendly", image_path: "https://www.flairtradetravels.org/assets/family_friendly.jpg")
good_for_groups = Category.create(name: "Good for Groups", image_path: "https://www.flairtradetravels.org/assets/good_for_groups.jpg")


Experience.create(title: "Public Art Walking Tour", description: "Denver is home to an eclectic and fascinating public art collection that involves much more than its poster child--a red-eyed stallion sculpture installed at Denver International Airport known for falling on and killing its artist (Luis Jimenez) shortly before he finished the piece. Your guide will take you on a walking tour of several installation sites around downtown Denver and share some history and information about each piece. Enjoy!", cost: 25, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/denver_art_walk_photo.png", status: "retired").categories << [city_life, arts_and_culture, good_for_groups]

Experience.create(title: "Brewery Crawl", description: "Join a well-known brewer for a crawl at three of her favorite breweries in Denver. (Please note: Drinks are not included in experience price.)", cost: 35, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/beer_tour_photo.jpg").categories << [city_life, food_and_drink, good_for_groups]

Experience.create(title: "Christmas Market & Hofbrauhaus", description: "Meet up with U.S. expat and fluent German speaker for a walkthrough one of the most famous holiday markets. Your guide will show you the ropes with it comes to haggling and direct you to some of the best vendors while sharing history about the market. Afterward, your guide will take you to the iconic Hofbrauhaus beer hall and enjoy a beer with you where your experience will comes end. Prost! (Please note: Drinks are not included in experience price.)", cost: 25, city: "Munich", image_path: "https://www.flairtradetravels.org/assets/german_xmas_market.jpg").categories << [arts_and_culture, family_friendly]

Experience.create(title: "Floating Market Visit", description: "Visiting a floating market is not something you want to skip when you visit Thailand. Join your guide for a stroll through one of the top markets in Bangkok, and learn about local customs and traditions, how select from the vendors (or visit them all!), and how to haggle with vendors (a normal and expected tradition). Boats in the market are piled high with tropical fruit and vegetables, fresh ready-to-drink coconut juice, and local food cooked from floating kitchens located right on the boat. Markets available for this experience include Taling Chan Market, Bang Ku Wiang Market, Tha Kha, and Damnoen Saduak.", cost: 45, city: "Bangkok", image_path: "https://www.flairtradetravels.org/assets/thai_market.jpg").categories << [arts_and_culture, city_life, food_and_drink]

Experience.create(title: "Walk and talk: Greenwich Village", description: "A long-time resident of Greenwich Village will meet you at a favorite local coffee shop for a little caffeine before setting out on foot for a walking tour of one of Manhattan's most beloved neighborhoods.", cost: 25, city: "New York", image_path: "https://www.flairtradetravels.org/assets/greenwich_village.jpg").categories << [city_life, food_and_drink, active_adventures]

Experience.create(title: "Denver Architectural History", description: "A Denver local and board member of the Denver Architectural Foundation will meet up with you at Union Station, Denver's iconic original train station that underwent a multi-million-dollar restoration a few years ago. You'll hear a little about the restoration and the general area's architecture over a cup of coffee or a beverage from the station's Terminal Bar before heading out on foot to learn about Denver's architectural style and history.", cost: 25, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/arch_tour.jpg").categories << [city_life, arts_and_culture]

Experience.create(title: "Red Rocks History and Hike", description: "Meet your guide in your best hemp poncho. You’ll tour the site where Phish first performed “Golgi Apparatus” to a stunned audience of 30,000. You’ll get the backstage pass to see where Jerry Garcia brainstormed “KC Jones” and you’ll discover why frisbees never come in black. This concert venue put Denver on the map.", cost: 25, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/red_rocks.jpg").categories << [active_adventures, great_outdoors, good_for_groups]

Experience.create(title: "Union Station visit", description: "Go back in time to this architectural gem. Built in the 1880’s, it stands as one of the iconic “doorways to the west”. Grab a coffee or beer to go with your locally-sourced beef jerky and hand-shucked oysters while you watch the hustle and bustle of people about the city. Includes a beverage and light snack.",  cost:  10, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/union_station.jpg").categories << [city_life, active_adventures, good_for_groups, arts_and_culture]

Experience.create(title: "Viennese Cafe Visit", description: "‘Thanks a latte!’ is what you’ll be saying after you join us for a tour of some of Vienna’s hidden cafes. Sit where Freud postulated his iconic theorems and presented to the biggest minds in psychoanalysis. Includes two beverages.", cost: 20, city: "Vienna", image_path: "https://www.flairtradetravels.org/assets/viennese_cafe.jpg").categories << [city_life, arts_and_culture, family_friendly]

Experience.create(title: "Willamette Valley Vineyard Tour", description: "Make sure your feet are washed, because you’ll be stomping grapes and being a part of your own vintage. Tour three vineyards, sample local charcuterie and finish the day with a Q+A with Willamette's most inventive vintner. Includes all transportation.", cost: 25, city: "Salem", image_path: "https://www.flairtradetravels.org/assets/vineyard_tour.jpg").categories << [food_and_drink, great_outdoors, arts_and_culture]

Experience.create(title: "Sunrise San Francisco", description: " 'Wake Up San Francisco' wasn’t just the name of Danny Tanner’s popular morning talk show in the early 90’s. You’ll be singing it from the hill tops (and there are plenty of them on this tour). You’ll visit Ghirardelli Square for a delicious morning treat, followed by a 'groovy' pit stop at Haight and Asbury, and we’ll cap off the afternoon with a picnic in the Presidio.",  cost: 15,  city: "San Francisco", image_path: "https://www.flairtradetravels.org/assets/san_fran_sunrise.jpg").categories << [city_life, active_adventures, good_for_groups]

Experience.create(title: "Mystery Tour", description: "Not for the feint of heart or weak of will. Throw caution to the wind and let our host decide where you’re off to. You might find yourself on a trail run, riding through City Park, or carving turns down from 13,000 feet at A-Basin. You’ll receive a message 24-hours in advance to tell you where to meet, what to pack and whether to bring your GoPro.Value: Priceless.", cost: 50, city: "Denver", image_path: "https://www.flairtradetravels.org/assets/mystery_tour.jpg").categories << [active_adventures, good_for_groups, great_outdoors]

Experience.create(title: "Cream City Cruise", description: "Always wear a life jacket and don’t rock the boat. You’ll take a two hour paddle through the lower Milwaukee River to the confluence of the Kinnikinnick and Menominee Rivers. Learn about Milwaukee’s storied past, from the first brew houses to the ice wars of the early 20th century.", cost: 25,  city: "Milwaukee", image_path: "https://www.flairtradetravels.org/assets/mke_river_kayak.jpg").categories << [great_outdoors, active_adventures]

Experience.create(title: "Paddle Hawaii", description: "Your core muscles will be lean and toned after our three-hour paddle around Hawaii’s’ ‘Lost Island’. Thought to have been swallowed by the sea during the 1983 Typhoon Rhonda, it’s a secret gem in the Pacific. Untouched by tourism, you’ll have a chance to see pristine reefs and colorful wildlife atop your board.",  cost: 35, city: "Honolulu", image_path: "https://www.flairtradetravels.org/assets/paddle_board_tour.jpg").categories << [active_adventures, great_outdoors, good_for_groups, family_friendly]

Experience.create(title: "Birding in BraziI", description: "I wouldn’t say it if it wasn’t true, but on a trip last year, one of our guests spotted a once-thought extinct Dodo. They’re alive and thriving and we know exactly where to find them. Wow your fellow amateur ornithologists at your next cocktail party with shots of rarely seen plumage.", cost: 10, city: "Rio", image_path: "https://www.flairtradetravels.org/assets/brid_watching_tour_photo.jpg").categories << [great_outdoors]

Experience.create(title: "Volcano Jumping", description:  "After this trip, you’ll realize that the Red Bull Rampage is mere child’s play. We’ll supply you with your rocket skates, a helmet and all the Mountain Dew your liver can synthesize. You bring your fearless attitude and your Facebook-ready smile. You’ll collect all the ‘likes’ on your next post.", cost: 100, city: "Pompeii", image_path: "https://www.flairtradetravels.org/assets/volcano_tour_photo.jpg").categories << [active_adventures, great_outdoors, arts_and_culture]
