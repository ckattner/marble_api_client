# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module MarbleApiClient
  module Responses
    # Allows for declarative body attribute naming in response classes
    module BodyAttributes
      class << self
        def included(klass)
          klass.extend(ClassMethods)
        end
      end

      # Extending ClassMethods to allow for module level class methods
      module ClassMethods
        def body_attributes(*keys)
          keys.each do |k|
            define_method(k) do
              parsed_body.dig(json_key(k))
            end
          end
        end
      end

      private

      def json_key(key)
        key.to_s.split('_').instance_eval do |k|
          [k.first] + k.drop(1).map(&:capitalize)
        end.join
      end

      def parsed_body
        @parsed_body ||= JSON.parse(body)
      end
    end
  end
end
