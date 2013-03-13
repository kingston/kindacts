class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :description
      t.integer :lat
      t.integer :lng
      t.integer :mission

      t.timestamps
    end
  end
end
