class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :score
      t.text :spirit_score
      t.integer :spirit_score_total
      t.string :mvp_male
      t.string :mvp_female
      t.string :msp

      t.timestamps
    end
  end
end
