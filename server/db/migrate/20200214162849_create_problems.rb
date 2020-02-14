class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :example_input
      t.text :example_output
      t.text :test_input
      t.text :expected_output

      t.timestamps
    end
	add_index :problems, :title, unique: true
  end
end
