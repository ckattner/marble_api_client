# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Requests
    # Request object for sending index requests.
    # Uses context, record, page, and page_size to send
    # data that the service model can use in controllers
    class Index
      acts_as_hashable

      def initialize(context: {}, record: {}, page: 1, page_size: 25)
        @context = context
        @record = record
        @page = page
        @page_size = page_size
        freeze
      end

      def request_body
        {
          context: @context,
          record: @record,
          page: @page,
          page_size: @page_size
        }.to_json
      end
    end
  end
end
