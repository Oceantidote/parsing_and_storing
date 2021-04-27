# require 'json'

# # TODO - let's read/write data from beers.json
# filepath    = 'data/beers.json'


# serialized_beers = File.read(filepath)
# # p serialized_beers

# data = JSON.parse(serialized_beers)
# p data["beers"]


# STORING

require 'json'

beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  },
  # etc...
]}
filepath = 'data/new_beers.json'
File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
