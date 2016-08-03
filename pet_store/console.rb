require_relative("./models/store")
require_relative("./models/pet")

require("pry-byebug")

store_1 = Store.new( { "name" => "Alans Alligator Aggregation", "address" => "1A Alligator Alley", "stock_type" => "alligators"} )
store_2 = Store.new( { "name" => "Johns Jellyfish Jamboree", "address" => "7J Jellyfish Junction", "stock_type" => "jellyfish"} )
store_3 = Store.new( { "name" => "Sians Shellfish Shenanigans", "address" => "6S Shellfish Shelf", "stock_type" => "shellfish"} )

store_1.save()
store_2.save()
store_3.save()

pet_1a = Pet.new( { "name" => "Kiyo the Caiman", "type" => "Caiman crocodilus", "store_id" => store_1.id } )
pet_1b = Pet.new( { "name" => "Katrina the Cuban Crocodile", "type" => "Crocodylus rhombifer", "store_id" => store_1.id } )
pet_2a = Pet.new( { "name" => "Simon the Sea Nettle", "type" => "Chrysaora quinquecirrha", "store_id" => store_2.id } )
pet_2b = Pet.new( { "name" => "Phil the Fried Egg", "type" => "Phacellophora camtschatica", "store_id" => store_2.id } )
pet_3a = Pet.new( { "name" => "Stuart the Scallop", "type" => "Pectinoidea", "store_id" => store_3.id } )
pet_3b = Pet.new( { "name" => "Lee the Langoustine", "type" => "Nephrops norvegicus
", "store_id" => store_3.id } )

pet_1a.save()
pet_1b.save()
pet_2a.save()
pet_2b.save()
pet_3a.save()
pet_3b.save()

binding.pry
nil