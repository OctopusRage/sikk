class Consultant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_auth_token

  validates :email, presence: true

  has_many :laporans, foreign_key: "consultant_id", class_name: "Laporan"

	def set_auth_token
    self.authentication_token = loop do
      token = SecureRandom.urlsafe_base64
      break token unless self.class.exists?(authentication_token: token)
    end unless authentication_token
  end
  def load_village
    village = VillageClient.get_data(self.area_id)
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

  def as_credential
    village = load_village
    village_name = village["kelurahan_desa"] if !village.nil?
    city = village["kabupaten_kota"] if !village.nil?
    kecamatan = village["kecamatan"] if !village.nil?
    province = village["propinsi"] if !village.nil?
    {
      fullname: fullname,
      email: email,
      area_id: area_id,
      province: province,
      city: city,
      kecamatan: kecamatan,
      village: village_name,
      authentication_token: authentication_token
    }
  end

  def as_json(options={})
    village = load_village
    village_name = village["kelurahan_desa"] if !village.nil?
    city = village["kabupaten_kota"] if !village.nil?
    kecamatan = village["kecamatan"] if !village.nil?
    province = village["propinsi"] if !village.nil?
    {
      fullname: fullname,
      email: email,
      area_id: area_id,
      province: province,
      city: city,
      kecamatan: kecamatan,
      village: village_name
    }
  end
end
