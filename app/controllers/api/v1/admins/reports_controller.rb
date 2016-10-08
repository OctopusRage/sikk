class Api::V1::Admins::ReportsController < AdminController
	before_action :authorize_admin
	def index
		laporan = Laporan.all
		total_data = laporan.count
		laporan = laporan.page(params[:page]) if params[:page]
		laporan = laporan.where(report_category_id: params[:id_category]) if params[:id_category]
		laporan = laporan.where(village_id: params[:village_id]) if params[:village_id]
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
		