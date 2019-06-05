module ROM
	module HTTP
		module Methods
			
			# Class that handles all DELETE HTTP requests
			class DeleteMethod < HTTPMethod
				
				# Instantiates the {ROM::HTTP::Methods::HTTPMethod} class
				# @param [ROM::Interconnect] itc Interconnect
				def initialize(itc)
					super(itc, 'delete', false, false)
				end
				
				# Resolves the given http request and formats the content with the given input/output serializers
				# @param [ROM::HTTP::HTTPRequest] http_request HTTP request to resolve
				# @param [ROM::DataSerializers::Serializer] input_serializer Input serializer, based on the Content-Type header. Not required
				# @param [ROM::DataSerializers::Serializer] output_serializer Output serializer, based on the Accepts header, defaults to {ROM::DataSerializers::JSONSerializer}. Not required
				def resolve(http_request, input_serializer, output_serializer)
					request = http_request
					path = format_path(request.path)
					
					plan = get_plan(path + [:delete])
					run_plan(plan, request, nil)
					
					HTTPResponse.new(StatusCode::NO_CONTENT)
				end
			end
		end
	end
end
