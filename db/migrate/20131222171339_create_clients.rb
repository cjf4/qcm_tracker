class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :username
      t.string :email
      t.string :company
      t.string :password_digest

      t.timestamps
    end
  end
end
