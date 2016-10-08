class Laporan < ActiveRecord::Base
	validates :title, presence: true
	validates :consumer_id, presence: true
	validates :village_id, presence: true

	belongs_to :report_category
	belongs_to :consultant, class_name: 'Consultant', foreign_key: 'laporan'
	belongs_to :consumer

	has_many :file_uploads, as: :uploader
	has_many :report_categories

  def load_village
    village = VillageClient.get_data(self.village_id)
    if !village.nil?
      if village["count"]["total"] == 1
        village["desa"][0]
      else
        nil
      end
    else
      nil
    end
  end

	def as_json(options={})
    village = load_village
    village_name = village["kelurahan_desa"] if !village.nil?
    city = village["kabupaten_kota"] if !village.nil?
    kecamatan = village["kecamatan"] if !village.nil?
    province = village["propinsi"] if !village.nil?
    {
      id: id,
      consumer_id: consumer_id,
      title: title,
      content: content,
      additional_info: additional_info,
      latitude: latitude, 
      longitude: longitude,
      village_id: village_id,
      village_name: village_name,
      city: city,
      kecamatan: kecamatan,
      province: province,
      process: process,
      verified_by: verified_by
    }
  end
end
