
class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :username
      x.string :password_digest
      x.string :neighborhood
    end
  end
end
