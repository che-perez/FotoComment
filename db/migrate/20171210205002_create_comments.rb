class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
	    t.text :comment
	    t.belongs_to :user, index: true
	    t.belongs_to :foto, index: true

	    t.timestamps
    end
  end
end
