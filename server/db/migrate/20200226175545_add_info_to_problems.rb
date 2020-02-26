class AddInfoToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :background_info, :text
    add_column :problems, :input_description, :text
    add_column :problems, :output_description, :text
  end
end
