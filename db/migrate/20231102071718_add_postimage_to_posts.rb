class AddPostimageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :postimage, :string
  end
end
