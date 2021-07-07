class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :accountNumber
      t.string :name
      t.string :email
      t.integer :age  #birthdate
      t.bigint :phone
      t.bigint :balance

      t.timestamps
    end
  end
end
