class Laporan < ActiveRecord::Base
	validates :title, presence: true
	validates :consumer_id, presence: true
	validates :village_id, presence: true

	belongs_to :report_category
	belongs_to :consultant, class_name: 'Consultant', foreign_key: 'laporan'
	belongs_to :consumer

	has_many :file_uploads, as: :uploader
	has_many :report_categories
end
