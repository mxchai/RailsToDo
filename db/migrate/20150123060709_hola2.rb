class Hola2 < ActiveRecord::Migration
  change_column :tasks, :duedate, :boolean, default:false
end
