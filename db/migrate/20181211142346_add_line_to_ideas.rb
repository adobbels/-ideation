class AddLineToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :line, :string
  end
end
