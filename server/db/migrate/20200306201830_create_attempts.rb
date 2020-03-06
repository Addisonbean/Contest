class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.references :contest, null: false, foreign_key: true
      t.integer :status
      t.string :language
      t.text :runtime_output
      t.text :runtime_errors
      t.string :uploaded_as

      t.timestamps
    end

	add_index :attempts, :status
  end
end
