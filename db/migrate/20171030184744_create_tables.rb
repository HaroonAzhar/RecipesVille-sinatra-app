class CreateTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
     
      end
     create_table :recipes do |t|
      t.string :name
       t.string  :user_id
      
  	  end
  	 create_table :ingredients do |t|
      t.string :name
      t.string :info
      end
  end
end
