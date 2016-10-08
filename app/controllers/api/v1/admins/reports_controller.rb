class Api::V1::Admins::ReportsController < AdminController
	before_action :authorize_admin
	def index
		laporan = Laporan.all
		total_data = laporan.count
		laporan = laporan.page(params[:page]) if params[:page]
		laporan = laporan.report_categories.where(id: params[:id_category]) if params[:id_category]
		render json: {
			status: 'success',
			data: {
				total_data: total_data,
				count: laporan.count,
				report: laporan
			}
		}, status: 200
	end
end
		