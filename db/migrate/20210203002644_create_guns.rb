class CreateGuns < ActiveRecord::Migration[6.1]
  def change
    create_table :guns do |t|
      t.integer :year
      t.string :model
      t.string :condition
      t.belongs_to :user
      t

      t.timestamps
    end
  end
end
