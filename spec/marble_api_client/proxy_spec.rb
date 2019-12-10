# frozen_string_literal: true

#
# Copyright (c) 2019-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'spec_helper'

RSpec.describe MarbleApiClient::Proxy do
  let(:proxy) do
    MarbleApiClient::Proxy.new(
      'http://www.example.com:3000',
      headers: { 'Content-Type': 'application/json' }
    )
  end

  it 'requires a base_url' do
    expect { MarbleApiClient::Proxy.new(nil) }
      .to raise_error(ArgumentError, 'Base URL is not valid')
  end

  it 'uses SSL for HTTPS requests' do
    p = MarbleApiClient::Proxy.new(
      'https://www.example.com:3000',
      headers: { 'Content-Type': 'application/json' }
    )

    stub_request(:post, 'https://www.example.com:3000/custom/path/create')
    p.create('custom/path')
    expect(WebMock).to have_requested(:post, 'https://www.example.com:3000/custom/path/create')
  end

  context 'create' do
    it 'sends requests to path' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/create')
      proxy.create('custom/path')
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/create')
    end

    it 'sends requests to path ending in "/"' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/create')
      proxy.create('custom/path/')
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/create')
    end

    it 'sends correct headers' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/create')
      proxy.create('custom/path', headers: { option: 'val' })
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/create')
        .with(headers: { 'Content-Type': 'application/json',
                         option: 'val' })
    end

    it 'sends the correct body' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/create')
      proxy.create('custom/path',
                   create_request: MarbleApiClient::Requests::Create.new(record: { name: 'blue' }))
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/create')
        .with(body: { context: {}, record: { name: 'blue' } })
    end
  end

  context 'index' do
    it 'sends to requested path' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/index')
      proxy.index('custom/path')
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/index')
    end

    it 'sends the correct headers' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/index')
      proxy.index('custom/path', headers: { option: 'val' })
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/index')
        .with(headers: { 'Content-Type': 'application/json',
                         option: 'val' })
    end

    it 'sends the correct body' do
      stub_request(:post, 'http://www.example.com:3000/custom/path/index')
      proxy.index('custom/path',
                  index_request: MarbleApiClient::Requests::Index.new(record: { name: 'blue' }))
      expect(WebMock).to have_requested(:post, 'http://www.example.com:3000/custom/path/index')
        .with(body: { context: {}, record: { name: 'blue' }, page: 1, page_size: 25 })
    end
  end
end
