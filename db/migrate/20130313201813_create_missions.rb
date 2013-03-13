class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :description
      t.string :act_autofill
      t.string :icon
      t.string :color
      t.integer :time
      t.integer :order

      t.timestamps
    end
  end
end
