class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.date :date
      t.time :start_time
      t.string :venue_name
      t.string :street_address
      t.string :state
      t.string :city
      t.integer :zipcode
      t.integer :admin_user_id
      t.text :details
      t.string :tournament_name

      t.timestamps
    end
  end
end
