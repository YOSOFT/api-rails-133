class CreateArticulos < ActiveRecord::Migration[5.2]
  def up
    create_table :articulos do |t|
      t.string :titulo, :limit => 25 
      t.text :contenido
      t.boolean :estado, :default => false
      #Ex:- :default =>''
      

      t.timestamps
    end
  end
  def down 
    drop_table :articulos
  end
end
