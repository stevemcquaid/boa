class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|

      t.timestamps
    end
  end
end
