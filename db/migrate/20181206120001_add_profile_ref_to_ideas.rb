class AddProfileRefToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :profile, foreign_key: true
  end
end
