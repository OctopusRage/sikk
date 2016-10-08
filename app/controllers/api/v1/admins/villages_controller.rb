class Api::V1::Admins::VillagesController < AdminController
	before_action :authorize_admin
	def index
		village = Village.all
		render json: {
			status: 'success',
			data: {
				total_data: total_data,
				count: user.count,
				village: village
			}
		}, status: 200
	end
end
		