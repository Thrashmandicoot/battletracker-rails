class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :job
      t.integer :total_hp
      t.integer :current_hp
      t.integer :armor_class
      t.integer :initiative
      t.boolean :alive
      t.references :user, index: true
      t.references :campaign, index: true

      t.timestamps
    end
  end
end
