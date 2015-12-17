class DropSecret2 < ActiveRecord::Migration
  def change
  	drop_table :secrets
  end
end
