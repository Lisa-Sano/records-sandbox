class DropWeirdTable < ActiveRecord::Migration
  def up
    drop_table :association_between_albums_and_artists
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end