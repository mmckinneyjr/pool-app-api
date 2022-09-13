class CreateStandings < ActiveRecord::Migration[7.0]
  def change
    create_table :standings do |t|
      t.integer :tournament_id
      t.integer :user_id
      t.integer :bracket_position
      t.integer :games_won
      t.integer :games_lost

      t.timestamps
    end
  end
end
