class Village < ActiveRecord::Base
	has_many :consumers
	has_many :consultants
	has_many :laporans
end
