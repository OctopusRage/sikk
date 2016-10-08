class Laporan < ActiveRecord::Base
	validates :title, presence: true
	validates :consumer_id, presence: true
	validates :village_id, presence: true

	belongs_to :report_category
	belongs_to :consultant, class_name: 'Consultant', foreign_key: 'laporan'
	belongs_to :consumer
  belongs_to :village

	has_many :file_uploads, as: :uploader

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

  def as_simple_json
    {
      id: id,
      consumer_id: consumer_id,
      title: title,
      content: content,
      additional_info: additional_info,
      latitude: latitude, 
      longitude: longitude,
      village_id: village_id,
      village_name: self.village.kelurahan_desa,
      city: self.village.kabupaten_kota,
      kecamatan: self.village.kecamatan,
      province: self.village.propinsi,
      process: process,
      verified_by: verified_by,
      report_category_id: report_category_id,
      report_category: report_category.category
    }
  end

	def as_json(options={})
    {
      id: id,
      consumer_id: consumer_id,
      title: title,
      content: content,
      additional_info: additional_info,
      latitude: latitude, 
      longitude: longitude,
      village_id: village_id,
      village_name: self.village.kelurahan_desa,
      city: self.village.kabupaten_kota,
      kecamatan: self.village.kecamatan,
      province: self.village.propinsi,
      process: process,
      verified_by: verified_by,
      report_category_id: report_category_id,
      report_category: report_category.category
    }
  end
end
