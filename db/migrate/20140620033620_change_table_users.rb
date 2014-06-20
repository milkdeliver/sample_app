class ChangeTableUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  	  t.rename :paword_digest, :password_digest
  	end
  end
end
