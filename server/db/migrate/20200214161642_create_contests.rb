class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active

      t.timestamps
    end
	add_index :contests, :title, unique: true
	add_index :contests, :active
  end
end
