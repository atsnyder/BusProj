class CreateRides < ActiveRecord::Migration
  def up
    create_table :rides do |t|
	t.string :from_city
    end
  end

  def down
  end
end
