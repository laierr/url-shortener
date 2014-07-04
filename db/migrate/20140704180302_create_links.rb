class CreateLinks < ActiveRecord::Migration
  def change
  	create_table :links do |table|
  		table.string :url, null: false
  		table.timestamps
  	end
  end
end
