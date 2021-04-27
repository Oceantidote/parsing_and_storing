require 'csv'


# PARSING
# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

beers = []
CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  beers << {name: row["Name"], appearance: row["Appearance"], origin: row["Origin"]}

end
p beers

beers << {name: "Hopdog", appearance: "Pale", origin: "Shoreditch"}

# STORING
csv_save_options = { col_sep: ',', force_quotes: true, quote_char: '"' }


CSV.open(filepath, 'wb', csv_save_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end
