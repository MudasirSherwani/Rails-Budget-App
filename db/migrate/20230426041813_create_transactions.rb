class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :amount, :default =>  0.00
      t.belongs_to :users, null: false, foreign_key: true
      t.belongs_to :categories, null: false, foreign_key: true
      t.timestamps
    end
  end
end
