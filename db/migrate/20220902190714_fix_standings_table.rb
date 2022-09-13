class FixStandingsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :standings, :games_won
    remove_column :standings, :games_lost
    add_column :standings, :round, :integer
    add_column :standings, :win, :boolean
  end
end
