# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'net/http'
require 'acts_as_hashable'

require_relative 'marble_api_client/client'
require_relative 'marble_api_client/requests'
require_relative 'marble_api_client/responses'

# This class interacts with Blue Marble Payroll Webglobe API
module MarbleApiClient
  class << self
    def client(base_url, headers: {})
      Client.new(base_url, headers)
    end
  end
end
