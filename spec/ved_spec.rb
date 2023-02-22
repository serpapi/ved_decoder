require 'spec_helper'

describe VedDecoder do
  describe 'string starts with 1' do
    it 'decodes i, t, r, s' do
      ['1t:22,r:6,i:86,s:90', '1t:22, r:6, i:86, s:90'].each do |str|
        vh = VedDecoder.decode(str).to_h
        _(vh).must_equal({
          index: 86,
          type: 22,
          result_position: 6,
          start_page: 90,
        })
      end
    end

    it 'discards unknown key' do
      vh = VedDecoder.decode('1a:1,b:2,c:3').to_h
      _(vh).must_equal({})
    end

    it 'decodes partially' do
      vh = VedDecoder.decode('1a:1,b:2,c:3,t:4').to_h
      _(vh).must_equal({ type: 4 })
    end
  end

  describe 'string starts with 0 or 2' do
    it 'decodes base64 encoded ved' do
      vh = VedDecoder.decode('2ahUKEwjZ5rDNt67pAhVDLKwKHS4wDD4QzLECKAEwSnoECBYQCg').to_h
      _(vh).must_equal({
        type: 39116,
        sub_result_position: 1,
        result_position: 74,
      })
    end

    it 'decodes base64 string with _' do
      vh = VedDecoder.decode('0ahUKEwiN2tmf0qj9AhUB_2EKHeATDdUQsKwBKAN6BQiMARAE').to_h
      _(vh).must_equal({
        type: 22064,
        sub_result_position: 3,
      })
    end

    it 'returns nil when base64 string is not valid' do
      _(VedDecoder.decode('321')).must_be_nil
    end

    it 'returns nil when string cannot be decoded' do
      _(VedDecoder.decode('2Y29mZmVlCg==')).must_be_nil
    end
  end

  describe 'method call on Ved' do
    it 'should work' do
      v = VedDecoder.decode('1t:22,r:6,i:86,s:90')
      _(v.index).must_equal 86
      _(v.type).must_equal 22
      _(v.result_position).must_equal 6
      _(v.start_page).must_equal 90
    end

    it 'returns 0 when not present' do
      v = VedDecoder.decode('1a:8')
      _(v.index).must_equal 0
      _(v.type).must_equal 0
      _(v.result_position).must_equal 0
      _(v.start_page).must_equal 0
      _(v.to_h).must_equal({})
    end
  end

  it 'returns nil when param is not String' do
    _(VedDecoder.decode(1)).must_be_nil
  end
end