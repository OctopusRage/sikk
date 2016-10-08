class Api::V1::Admins::ReportsController < AdminController
	before_action :authorize_admin
	def index
		laporan = Laporan.all
		total_data = laporan.count
		laporan = laporan.page(params[:page]) if params[:page]
		laporan = laporan.where(report_category_id: params[:id_category]) if params[:id_category]
		laporan = laporan.by_report_date(params[:start_date], params[:end_date]) if params[:start_date]
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

	def category_graph
		categories = ReportCategory.joins(
			"INNER JOIN laporans ON laporans.report_category_id = report_categories.id"
		).group(:category).count
		total = 0
		categories.each do |x|
			total += x[1]
		end
		render json: {
			status: 'success',
			data: {
				stats: categories
				total: total
			}
		}, status: 200
	end
end
		