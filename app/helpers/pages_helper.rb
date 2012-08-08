module PagesHelper

require "net/https"
require 'open-uri'
require 'openssl'


	def asana(task,api) 
		
		api_key = api
		result = JSON.parse(open("https://app.asana.com/api/1.0/workspaces", :http_basic_authentication=>[api, " "]).read)
		workspace_id = result['data'][0]['id']
		assignee = 'zakaria@zakaria.com'

		# (source) http://developers.asana.com/documentation/ : begin
		uri = URI.parse("https://app.asana.com/api/1.0/tasks")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_PEER
		#http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		header = {
	  		"Content-Type" => "application/json"
		}

		req = Net::HTTP::Post.new(uri.path, header)
		req.basic_auth(api_key, '')
		req.body = {
	  		"data" => {
	   		"workspace" => workspace_id,
	    	"name" => task,
	   		"assignee" => assignee
	 		}
		}.to_json()

		res = http.start { |http| http.request(req) }

		body = JSON.parse(res.body)
		if body['errors'] then
	   		 puts "Server returned an error: #{body['errors'][0]['message']}"
		else
	  		puts "Created task with id: #{body['data']['id']}"
		end
		# (source) http://developers.asana.com/documentation/ : end 
	end 


end
