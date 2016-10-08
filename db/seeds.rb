# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ReportCategory.create([
	{category: "Bencana"},
	{category: "Kegiatan Sosial"},
	{category: "Terorisme"},
	{category: "Kriminal"}
])


Consultant.create([
	{fullname:"babinsa1", email:"babinsa1@mail.com", password:"babinsa", area_id: 45677},
	{fullname:"babinsa2", email:"babinsa2@mail.com", password:"babinsa", area_id: 45676},
	{fullname:"babinsa3", email:"babinsa3@mail.com", password:"babinsa", area_id: 45677},
	{fullname:"babinsa4", email:"babinsa4@mail.com", password:"babinsa", area_id: 45672}
])

Consumer.create([
	{fullname:"RT1", email:"babinsa1@mail.com", password:"babinsa", area_id: 45677},
	{fullname:"babinsa2", email:"babinsa2@mail.com", password:"babinsa", area_id: 45676},
	{fullname:"babinsa3", email:"babinsa3@mail.com", password:"babinsa", area_id: 45677},
	{fullname:"babinsa4", email:"babinsa4@mail.com", password:"babinsa", area_id: 45672}
])

village = VillageClient.get_data_by_province('JAWA TIMUR')
village["desa"].each do |vil|
	Village.create(
		kd_prop: vil['kd_prop'],
		kd_kab: vil['kd_kab'],
		kd_kec: vil['kd_kec'],
		kd_desa: vil['kd_desa'],
		propinsi: vil['propinsi'],
		kabupaten_kota: vil['kabupaten_kota'],
		kecamatan: vil['kecamatan'],
		kelurahan_desa: vil['kelurahan_desa']
	)
end