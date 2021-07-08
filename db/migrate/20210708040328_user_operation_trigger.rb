class UserOperationTrigger < ActiveRecord::Migration[6.1]
  def self.up

    execute <<-SQL
      CREATE TRIGGER `userOperationTrigger`
      AFTER INSERT ON `movements` 
      FOR EACH ROW 
      IF NEW.operation = 'transfer' THEN 
        UPDATE users SET balance = balance - NEW.amount WHERE id = NEW.user_id;
        UPDATE users SET balance = balance + NEW.amount WHERE accountNumber = NEW.destinationAccount;
      ELSEIF NEW.operation = 'deposit' THEN
        UPDATE users SET balance = balance + NEW.amount WHERE id = NEW.user_id;
      ELSEIF NEW.operation = 'withdrawal' THEN 
        UPDATE users SET balance = balance - NEW.amount WHERE id = NEW.user_id;
      END IF;
    SQL

  end
end
