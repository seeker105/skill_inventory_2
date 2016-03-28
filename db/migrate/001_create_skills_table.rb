require 'sequel'

database = Sequel.sqlite('db/skill_inventory.sqlite')
database.create_table :skills do
  primary_key :id
  String      :title
  String      :description
end
