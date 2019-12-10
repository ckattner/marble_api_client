# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Requests
    # Index Request Object
    class Index
      def initialize(context: {}, record: {}, page: 1, page_size: 25)
        @context = context
        @record = record
        @page = page
        @page_size = page_size
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
