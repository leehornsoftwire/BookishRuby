class AddUserIdToCopies < ActiveRecord::Migration[5.2]
  def change
    remove_column :copies, :borrower, :string
    add_reference :copies, :user, foreign_key: true
  end
end
