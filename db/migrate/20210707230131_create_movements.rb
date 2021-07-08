class CreateMovements < ActiveRecord::Migration[6.1]
  def change
    create_table :movements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :operation  # [transfer, deposit, withdrawal]
      t.integer :destinationAccount, null: true # only if type is transfer
      t.bigint :amount

      t.timestamps
    end
  end
end
