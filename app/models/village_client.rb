require 'httparty'
class VillageClient
	BASE_URL = 'http://ekapaksi.hacks.id'
	def self.login
		response = HTTParty.post("#{BASE_URL}/auth/login", {body: {
			app_id: 'hackathon',
			secret_key: 'Y4NTidF6EJ7nDMytB9Km40kzjsn5mlOS',
			username: 'demo',
			password: 'demo'
		}})
		response_body = JSON.parse(response.body)
		if response_body["success"] == true
			response_body["token"]
		else
			nil
		end
	end

	def self.get_data(id=nil)
		token = login
		if !token.nil?
			header = {
        "Authorization" => "Bearer #{token}"
      }
			response = HTTParty.get("#{BASE_URL}/api/v1/desa?id=#{id}", headers:header)
			response_body = JSON.parse(response.body)
			JSON.parse(response.body) if !response.body.empty?
		else
			nil
		end
	end

	def self.get_data_by_province(prop=nil)
		token = login
		if !token.nil?
			header = {
        "Authorization" => "Bearer #{token}"
      }
			response = HTTParty.get("#{BASE_URL}/api/v1/desa?propinsi=#{prop}", headers:header)
			response_body = JSON.parse(response.body)
			JSON.parse(response.body) if !response.body.empty?
		else
			nil
		end
	end
end