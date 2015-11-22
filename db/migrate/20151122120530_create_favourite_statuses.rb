class CreateFavouriteStatuses < ActiveRecord::Migration
  def change
    create_table :favourite_statuses do |t|
      t.text :status
      t.references :user, index: true
      t.integer :member_id

      t.timestamps null: false
    end
    add_foreign_key :favourite_statuses, :users
  end
end
