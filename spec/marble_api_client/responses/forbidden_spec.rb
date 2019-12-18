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
                      body: { message: 'not allowed',
                              redirectUrl: 'www.example.com/hello' }.to_json)
    end

    it 'message' do
      expect(described_class.new(response).message)
        .to eq('not allowed')
    end

    it 'Redirect URL' do
      expect(described_class.new(response).redirect_url)
        .to eq('www.example.com/hello')
    end
  end
end
