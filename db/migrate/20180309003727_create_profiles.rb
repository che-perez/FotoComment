class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username, null: false, unique: true, default: ""
      t.text :description, default: ""
      t.belongs_to :user, index: true

      t.timestamp
    end

    remove_column :users, :username, :string
  end
end
