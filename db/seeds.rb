
require 'csv'

# delete / destroy all the data first
Station.destroy_all
Train.destroy_all
Stop.destroy_all
puts "=> All data deleted"


# reset the primary keys to start with id=1
ActiveRecord::Base.connection.reset_pk_sequence!('stations')
ActiveRecord::Base.connection.reset_pk_sequence!('trains')
ActiveRecord::Base.connection.reset_pk_sequence!('stops')


# load Stations data from csv file in lib/seeds
puts "=> Starting load of Stations data"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'stations_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = Station.new
  s.name = row['name']
  s.station_name = row['station_name']
  s.save
  puts "   Station #{s.name} saved"
end
puts "=> There are now #{Station.count} rows in the stations table"


# load Trains data from csv file in lib/seeds
puts "=> Starting load of Trains data"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'trains_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Train.new
  t.train_number = row['train_number']
  t.direction = row['direction']
  t.service_type = row['service_type']
  t.save
  puts "   Train Number #{t.train_number} saved"
end
puts "=> There are now #{Train.count} rows in the trains table"


# load Stops data from csv file in lib/seeds
puts "=> Starting load of Stops data"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'stops_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = Stop.new
  s.station_id = row['station_id']
  s.train_id = row['train_id']
  s.departure_time = row['departure_time_offset']
  s.save
  # puts "   Stop with station_id #{s.station_id}, train_id #{s.train_id} saved"
end
puts "=> There are now #{Stop.count} rows in the stops table"
