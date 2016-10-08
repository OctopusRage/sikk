class Api::V1::Admins::ReportsController < AdminController
	before_action :authorize_admin
	def index
		laporan = Laporan.all
		laporan = laporan.page(params[:page]) if params[:page]
		render json: {
			status: 'success',
			data: laporan
		}, status: 200
	end
end
		