class AddClientToProjects < ActiveRecord::Migration
  def change
  	drop_table :projects
  end
end
