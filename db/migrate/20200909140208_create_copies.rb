class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.references :book, foreign_key: true
      t.string :borrower
      t.date :due_date
    end
  end
end
