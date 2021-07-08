class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :accountNumber
      t.string :name, null: false
      t.string :email, null: false
      t.integer :age  #birthdate
      t.bigint :phone, null: false
      t.bigint :balance, default: 0

      t.timestamps
    end

    add_index :users, :accountNumber, unique: true
    
  end
end
