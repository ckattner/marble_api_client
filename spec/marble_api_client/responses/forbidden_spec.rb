# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::Forbidden do
  context 'provides' do
    let(:response) do
      instance_double(Net::HTTPResponse,
                      code: 400,
                      body: { statusCode: '403',
                              redirectUrl: 'www.example.com/hello' }.to_json)
    end

    it 'Status Code' do
      expect(described_class.new(response).status_code)
        .to eq('403')
    end

    it 'Redirect URL' do
      expect(described_class.new(response).redirect_url)
        .to eq('www.example.com/hello')
    end
  end
end
