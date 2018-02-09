class AddWordSearchToSearch < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :word_search, :string
  end
end
