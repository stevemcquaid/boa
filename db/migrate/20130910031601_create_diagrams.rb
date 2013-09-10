class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.integer :diagram_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
