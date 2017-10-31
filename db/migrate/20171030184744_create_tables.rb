class CreateTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :rank
      end
     create_table :recipes do |t|
      t.string :name
      t.integer :rating
      t.integer  :budget
      t.string  :user_id
      
  	  end
  	 create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.string  :recipe_id
      end
  end
end
