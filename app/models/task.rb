class Task < ActiveRecord::Base
	acts_as_taggable
	belongs_to :list
	validates :description, presence: true
end
