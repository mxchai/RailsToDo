class Hol3 < ActiveRecord::Migration
	change_column :tasks, :duedate, :datetime 
	change_column :tasks, :completed, :boolean, default:false
end
