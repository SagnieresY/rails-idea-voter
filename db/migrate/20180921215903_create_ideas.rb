class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :text
      t.integer :votes

      t.timestamps
    end
  end
end
