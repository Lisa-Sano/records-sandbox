# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
FILE_PATH = 'db/seed_data/20160406-record-collection.csv'

# headers: true treats the headers as keys, so we can iterate through the file as hashes
# instead of as arrays (it would be arrays if headers: false).
CSV.foreach(FILE_PATH, headers: true) do |row|
  row_hash = row.to_h
  artist_name = row_hash.delete("artist")

  artist = Artist.find_or_create_by(name: artist_name)
  artist.albums << Album.create(row_hash)
end