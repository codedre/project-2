class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.timestamps
      t.belongs_to :mood
    end
  end
end
