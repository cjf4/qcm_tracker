class Project < ActiveRecord::Base
	validates :month, presence: true
	validates :year, presence: true

	belongs_to :client
end
