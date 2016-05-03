class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      # label_code,artist,title,label,format,released,date_added
      # string,string,string,string,string,integer,datetime
      t.string :label_code
      t.string :artist, null: false
      t.string :title, null: false
      t.string :label
      t.string :format
      t.integer :released
      t.datetime :date_added
      t.timestamps null: false
    end
  end
end
