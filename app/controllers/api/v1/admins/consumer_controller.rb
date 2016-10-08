class Api::V1::Admins::ConsumersController < AdminController
	before_action :authorize_admin
	def index
		user = Consumer.all
		total_data = user.count
		user = user.page(params[:page]) if params[:page]
		user = user.where(village_id: params[:village_id]) if params[:village_id]
		render json: {
			status: 'success',
			data: {
				total_data: total_data,
				count: user.count,
				personel: user
			}
		}, status: 200
	end
end
		