class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.integer :gender
      t.string :picture_source

      t.timestamps
    end
  end
end
