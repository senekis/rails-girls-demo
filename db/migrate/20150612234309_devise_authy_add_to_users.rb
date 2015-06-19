class DeviseAuthyAddToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string    :authy_id
      t.datetime  :last_sign_in_with_authy
      t.boolean   :authy_enabled, :default => false
      t.string    :country_code
      t.string    :phone_number
    end

    add_index :users, :authy_id
  end

  def self.down
    change_table :users do |t|
      t.remove :authy_id, :last_sign_in_with_authy, :authy_enabled, :country_code, :phone_number
    end
  end
end

