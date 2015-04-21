# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"



CSV.foreach((Rails.root.join + "db/csv/steps.csv"), { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Step.create(row.to_hash)
end