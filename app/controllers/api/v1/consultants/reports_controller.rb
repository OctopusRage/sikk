class Api::V1::Consultants::ReportsController < ApplicationController
	before_action :authorize_user
	def index
		village_id = current_consultant.area_id
		laporan = Laporan.where(village_id: village_id)
		render json: {
			status: 'success',
			data: laporan
		}, status: 200
	end

	def update
		laporan = current_consultant.laporans.find(params[:id])
		if laporan.present?
			laporan.update(report_params)
			render json: {
				status: 'success',
				data: laporan
			}, status: 200
		else
			render json: {
				status: 'fail',
				message: "#{laporan.errors.full_messages.first}"
			}, status: 422
		end
	end
	private
		def report_params
			params.require(:laporan).permit(:consumer_id, :title, :village_id, :latitude, :longitude, 
				:process, :verified_by, :content, :additional_info, :report_category_id)
		end
end
		