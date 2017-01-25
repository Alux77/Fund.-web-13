class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.string :user
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end