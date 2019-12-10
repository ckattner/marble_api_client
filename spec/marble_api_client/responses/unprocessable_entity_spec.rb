# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::UnprocessableEntity do
  context 'provides' do
    let(:errors) { [{ name: 'invalid' }].to_json }
    let(:error_properties) { %w[property_1 property_2].to_json }
    let(:warnings) { [{ name: 'warning' }].to_json }
    let(:warning_properties) { %w[property_3 property_4].to_json }
    let(:response) do
      instance_double(Net::HTTPResponse,
                      code: 400,
                      body: {
                        errors: errors,
                        errorProperties: error_properties,
                        warnings: warnings,
                        warningProperties: warning_properties
                      }.to_json)
    end

    it 'errors' do
      expect(described_class.new(response).errors)
        .to eq(errors)
    end

    it 'error properties' do
      expect(described_class.new(response).error_properties)
        .to eq(error_properties)
    end

    it 'warnings' do
      expect(described_class.new(response).warnings)
        .to eq(warnings)
    end

    it 'warning properties' do
      expect(described_class.new(response).warning_properties)
        .to eq(warning_properties)
    end
  end
end
