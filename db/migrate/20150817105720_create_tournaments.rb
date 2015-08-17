class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :date_from
      t.datetime :date_to
      t.string :venue
      t.text :description

      t.timestamps
    end
  end
end
