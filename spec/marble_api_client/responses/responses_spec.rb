# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses do
  it 'requires a HTTPResponse' do
    response = nil
    expect { described_class.parse_response(response, 'index') }
      .to raise_error(ArgumentError)
  end

  describe 'objects returned for various HTTP status codes' do
    specify '200' do
      response = Net::HTTPResponse.new(1.0, '200', 'OK')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::Success)
    end

    specify '200 Index' do
      response = Net::HTTPResponse.new(1.0, '200', 'OK')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::List)
    end

    specify '200 Create' do
      response = Net::HTTPResponse.new(1.0, '200', 'OK')
      response.uri = 'www.exampleuri.com/create'
      expect(described_class.parse_response(response, 'create'))
        .to be_a_kind_of(MarbleApiClient::Responses::Record)
    end

    specify '400' do
      response = Net::HTTPResponse.new(1.0, '400', 'Client Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::BadRequest)
    end

    specify '401' do
      response = Net::HTTPResponse.new(1.0, '401', 'Client Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::Unauthorized)
    end

    specify '403' do
      response = Net::HTTPResponse.new(1.0, '403', 'Client Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::Forbidden)
    end

    specify '404' do
      response = Net::HTTPResponse.new(1.0, '404', 'Client Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::NotFound)
    end

    specify '422' do
      response = Net::HTTPResponse.new(1.0, '422', 'Client Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::UnprocessableEntity)
    end

    specify '500' do
      response = Net::HTTPResponse.new(1.0, '500', 'Server Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::ServerError)
    end

    specify '501' do
      response = Net::HTTPResponse.new(1.0, '501', 'Server Error')
      response.uri = 'www.exampleuri.com/index'
      expect(described_class.parse_response(response, 'index'))
        .to be_a_kind_of(MarbleApiClient::Responses::NotImplemented)
    end
  end
end
