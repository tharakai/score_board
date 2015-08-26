class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :tournament_id
      t.integer :game_number
      t.string :name

      t.timestamps
    end
  end
end
