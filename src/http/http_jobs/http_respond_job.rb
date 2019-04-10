module ROM
  module HTTP
    class HTTPRespondJob < ROM::Job

      def http_request
        @http_request
      end

      def client
        @client
      end

      # Instantiates the {ROM::HTTPResponseJob} class
      # @param [String] redirect Location where to redirect all requests, if empty then no redirect
      def initialize(resolver, client, redirect = "")
        @client = client
        @http_request = HTTPRequest.new(client)
        @redirect = redirect
        @resolver = resolver
      end

      # Responds to the client, if redirect is turned on it redirects him.
      def job_task        
        if @redirect == nil
          http_response = @resolver.resolve(@http_request)
        else
          http_response = HTTPResponse.new(ROM::HTTP::StatusCode::MOVED_PERMANENTLY, nil, :location => "#{@redirect}#{@http_request.path}")
        end
        resp = http_response.stringify
      ensure
        client.write(resp)
        client.close
        return http_response
      end
    end
  end
end