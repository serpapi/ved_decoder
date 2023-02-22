# frozen_string_literal: true

require 'base64'
require_relative "ved_decoder/version"
require_relative 'ved_decoder/ved_pb'

module VedDecoder
  KEY_MAPPER = {'i' => 'index', 't' => 'type', 'r' => 'result_position', 's' => 'start_page'}

  def self.decode(str)
    return nil unless str.is_a?(String)

    if str[0] == '1'
      params = {}
      str[1..].split(',').each do |param|
        kv = param.strip.split(':')
        next unless kv.size == 2

        if key = KEY_MAPPER[kv[0]]
          params[key] = kv[1].to_i
        end
      end
      Ved.new(params)
    else
      Ved.decode(Base64.urlsafe_decode64(str[1..]))
    end
  rescue
    nil
  end
end
