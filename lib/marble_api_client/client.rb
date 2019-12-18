# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  # Main class for sending HTTP requests to a URL.
  # Requests are sent using request and response objects crafted for each action.
  # Headers can be provided to the Proxy as default headers for all requests
  class Client
    def initialize(base_url, headers: {})
      raise ArgumentError, 'Base URL is not valid' unless base_url_valid?(base_url)

      @base_url = base_url
      @headers = { 'Content-Type': 'application/json' }.merge(headers)
      freeze
    end

    def create(path, create_request: Requests::Create.new, headers: {})
      response = send_request(path, create_request, headers, 'create')
      Responses.parse_response(response, Responses::CREATE_ACTION)
    end

    def index(path, index_request: Requests::Index.new, headers: {})
      response = send_request(path, index_request, headers, 'index')
      Responses.parse_response(response, Responses::INDEX_ACTION)
    end

    private

    def send_request(path, request_object, headers, action)
      uri = join_path(path, action)
      merged_headers = @headers.merge(headers)

      Net::HTTP.start(uri.host, uri.port, use_ssl: ssl?(uri)) do |http|
        request = Net::HTTP::Post.new(uri.request_uri)
        merged_headers.each { |key, value| request.add_field(key.to_s, value.to_s) }
        request.body = request_object.request_body
        http.request(request)
      end
    end

    def join_path(path, action)
      if path[-1] == '/'
        URI.join(@base_url, path + action)
      else
        URI.join(@base_url, path + '/' + action)
      end
    end

    def ssl?(uri)
      uri.scheme == 'https'
    end

    def base_url_valid?(url)
      uri = URI.parse(url)
      uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    rescue URI::InvalidURIError
      false
    end
  end
end
