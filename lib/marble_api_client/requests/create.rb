# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Requests
    # Request object for sending create requests.
    # Uses context and record to send data that
    # the service model can use in controllers
    class Create
      acts_as_hashable

      def initialize(context: {}, record: {})
        @context = context
        @record = record
        freeze
      end

      def request_body
        {
          context: @context,
          record: @record
        }.to_json
      end
    end
  end
end
