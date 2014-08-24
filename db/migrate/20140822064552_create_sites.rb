class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.datetime :date

      t.timestamps
    end
  end
end
