class AddCompilationOutputToAttempts < ActiveRecord::Migration[6.0]
  def change
    add_column :attempts, :compilation_output, :text
  end
end
