class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :month
      t.integer :year
      t.float :socialmedia
      t.float :seo
      t.float :sales
      t.float :web_design
      t.float :creative_design

      t.timestamps
    end
  end
end
