class Api::V1::Consumers::ReportsController < ApplicationController
	before_action :authorize_user
	def index
		laporan = Laporan.all
		render json: {
			status: 'success',
			data: laporan
		}, status: 200
	end
	def create
		laporan = Laporan.new(report_params)
		if laporan.valid?
			if laporan.save
				render json: {
					status: 'success',
					data: laporan
				}, status: 201
			else
				render json: {
					status: 'fail',
					message: "#{laporan.errors}"
				}, status: 422
			end
		else
			render json: {
				status: 'fail',
				message: 'failed to post'
			}, status: 422
		end
	end	
	private
		def report_params
			params.require(:laporan).permit(:consumer_id, :title, :vilage_id, :latitude, :longitude, :process, :verified_by, :content,
			:additional_info, :report_category_id)
		end
		
end
		