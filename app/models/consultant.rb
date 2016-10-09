class Consultant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_auth_token

  validates :email, presence: true

  has_many :laporans, foreign_key: "consultant_id", class_name: "Laporan"

  belongs_to :village
	def set_auth_token
    self.authentication_token = loop do
      token = SecureRandom.urlsafe_base64
      break token unless self.class.exists?(authentication_token: token)
    end unless authentication_token
  end
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

  def as_credential
    {
      fullname: fullname,
      email: email,
      village_id: village_id,
      village_name: self.village.kelurahan_desa,
      city: self.village.kabupaten_kota,
      kecamatan: self.village.kecamatan,
      province: self.village.propinsi,
      authentication_token: authentication_token
    }
  end

  def as_json(options={})
    
    {
      fullname: fullname,
      email: email,
      village_id: village_id,
      village_name: self.village.kelurahan_desa,
      city: self.village.kabupaten_kota,
      kecamatan: self.village.kecamatan,
      province: self.village.propinsi,
    }
  end
end
