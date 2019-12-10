# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # 200 Response Index Class
    class List < Success
      PAGE = 'page'
      PAGE_SIZE = 'pageSize'
      META = 'meta'
      RECORDS = 'records'
      SORT_DIRECTION = 'sortDirection'
      SORT_COLUMN_INDEX = 'sortColumnIndex'
      TOTAL = 'total'
      TOTAL_PAGES = 'totalPages'

      def initialize(response)
        super
      end

      def page
        parsed_body.dig(PAGE)
      end

      def page_size
        parsed_body.dig(PAGE_SIZE)
      end

      def meta
        parsed_body.dig(META)
      end

      def records
        parsed_body.dig(RECORDS)
      end

      def sort_direction
        parsed_body.dig(SORT_DIRECTION)
      end

      def sort_column_index
        parsed_body.dig(SORT_COLUMN_INDEX)
      end

      def total
        parsed_body.dig(TOTAL)
      end

      def total_pages
        parsed_body.dig(TOTAL_PAGES)
      end
    end
  end
end
