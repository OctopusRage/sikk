class Api::V1::Consumers::ReportsController < AdminController
	before_action :authorize_admin
	def index
		laporan = Laporan.all
		render json: {
			status: 'success',
			data: laporan
		}, status: 200
	end
end
		