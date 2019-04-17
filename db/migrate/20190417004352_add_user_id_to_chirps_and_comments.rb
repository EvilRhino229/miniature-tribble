class AddUserIdToChirpsAndComments < ActiveRecord::Migration[5.2]
  def change
    add_column :chirps, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
