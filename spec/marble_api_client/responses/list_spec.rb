# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Responses::List do
  context 'provides' do
    let(:page) { '7' }
    let(:page_size) { '12' }
    let(:meta) { { grid_color: 'blue' }.to_json }
    let(:records) { [{ name: 'record_1' }, { name: 'record_2' }].to_json }
    let(:sort_direction) { 'ASC' }
    let(:sort_column_index) { '3' }
    let(:total) { '120' }
    let(:total_pages) { '10' }
    let(:response) do
      instance_double(Net::HTTPResponse,
                      code: 400,
                      body: {
                        page: page,
                        pageSize: page_size,
                        meta: meta,
                        records: records,
                        sortDirection: sort_direction,
                        sortColumnIndex: sort_column_index,
                        total: total,
                        totalPages: total_pages
                      }.to_json)
    end

    specify 'page' do
      expect(described_class.new(response).page)
        .to eq(page)
    end

    specify 'page_size' do
      expect(described_class.new(response).page_size)
        .to eq(page_size)
    end

    specify 'meta' do
      expect(described_class.new(response).meta)
        .to eq(meta)
    end

    specify 'records' do
      expect(described_class.new(response).records)
        .to eq(records)
    end

    specify 'sort driection' do
      expect(described_class.new(response).sort_direction)
        .to eq(sort_direction)
    end

    specify 'sort column index' do
      expect(described_class.new(response).sort_column_index)
        .to eq(sort_column_index)
    end

    specify 'total' do
      expect(described_class.new(response).total)
        .to eq(total)
    end

    specify 'total pages' do
      expect(described_class.new(response).total_pages)
        .to eq(total_pages)
    end
  end
end
