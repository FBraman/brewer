# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require "csv"


# CSV.foreach((Rails.root.join + "db/csv/components4_17.csv"), { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
#   Component.create(row.to_hash)
# end


# CSV.foreach((Rails.root.join + "db/csv/steps.csv"), { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
#   Step.create(row.to_hash)
# end

require 'csv'


file = File.read('z_users.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  if !User.find_by(username: row[:username])
    user = User.create!(username: row[:username], email: row[:email], password: row[:password])
  else
    user = User.find_by(username: row[:username])
  end
end

file = File.read('z_recipes.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  if !Recipe.find_by(recipe_name: row[:recipe_name])
    recipe = Recipe.create!(recipe_name: row[:recipe_name], target_volume: row[:target_volume], mash_thickness: row[:mash_thickness], 
    	user_id: row[:user_id], efficiency: row[:efficiency], mash_temp: row[:mash_temp], 
    	grain_temp: row[:grain_temp], boil_length: row[:boil_length])
  else
    recipe = Recipe.find_by(recipe_name: row[:recipe_name])
  end
end

file = File.read('z_components.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  if !Component.find_by(name: row[:name])
    component = Component.create!(version: row[:version], name: row[:name], aa: row[:aa], ppg: row[:ppg], 
    	srm: row[:srm], attenuation: row[:attenuation], temperature_range: row[:temperature_range], 
    	description: row[:description], alcohol_tolerance: row[:alcohol_tolerance], flocculation: row[:flocculation])
  else
    component = Component.find_by(name: row[:name])
  end
end

file = File.read('z_ingredients.csv')
csv = CSV.parse(file, :headers => true, :header_converters => :symbol)
csv.each do |row|
  if !Ingredient.find_by(recipe_id: row[:recipe_id], component_id: row[:component_id], boil_time: row[:boil_time])
    ingredient = Ingredient.create!(recipe_id: row[:recipe_id], component_id: row[:component_id],
    amount: row[:amount], boil_time: row[:boil_time])
  else
    ingredient = Ingredient.find_by(recipe_id: row[:recipe_id], component_id: row[:component_id], boil_time: row[:boil_time])
  end
end