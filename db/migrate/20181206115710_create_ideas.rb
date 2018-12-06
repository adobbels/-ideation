class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :business_case
      t.text :value_prop
      t.text :target_market
      t.text :problem
      t.text :solution
      t.text :revenue

      t.timestamps
    end
  end
end
