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

Admin.create([
	{email:"admin@mail.com", password:"password"}
])

Consultant.create([
	{fullname:"babinsa1", email:"babinsa1@mail.com", password:"babinsa", village_id: 1},
	{fullname:"babinsa2", email:"babinsa2@mail.com", password:"babinsa", village_id: 3},
	{fullname:"babinsa3", email:"babinsa3@mail.com", password:"babinsa", village_id: 5},
	{fullname:"babinsa4", email:"babinsa4@mail.com", password:"babinsa", village_id: 1}
])

Consumer.create([
	{fullname:"RT1", email:"masyarakat1@mail.com", password:"babinsa", village_id: 1},
	{fullname:"RT2", email:"masyarakat2@mail.com", password:"babinsa", village_id: 3},
	{fullname:"RT3", email:"masyarakat3@mail.com", password:"babinsa", village_id: 5},
	{fullname:"RT4", email:"masyarakat4@mail.com", password:"babinsa", village_id: 1}
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

laporan = Laporan.create([
	{
		consumer_id: 1,
		title: 'Banjir',
		report_category_id: 1,
		content: 'awas banjir',
		village_id: 1
	},
	{
		consumer_id: 1,
		title: 'Acara dangdut',
		report_category_id: 2,
		content: 'awas dangdut',
		village_id: 1
	},
	{
		consumer_id: 2,
		title: 'Pergerakan mencurigakan',
		report_category_id: 3,
		content: 'Terorisme mencekam',
		village_id: 3
	},
	{
		consumer_id: 1,
		title: 'Pembunuhan di jalan jawa',
		report_category_id: 4,
		content: 'awas banjir',
		village_id: 1
	},
	{
		consumer_id: 1,
		title: 'Longsor',
		report_category_id: 1,
		content: 'awas longsor',
		village_id: 1
	},
])