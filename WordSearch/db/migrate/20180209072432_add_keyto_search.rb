class AddKeytoSearch < ActiveRecord::Migration[5.1]
  def change
	add_column :searches, :key, :string
  end
end
