class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :tournament_id
      t.string :city
      t.string :captain_name
      t.string :spirit_captain_name
      t.string :email_1
      t.string :contact_1
      t.string :email_2
      t.string :contact_2

      t.timestamps
    end
  end
end
