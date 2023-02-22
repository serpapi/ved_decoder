# frozen_string_literal: true

require_relative "lib/ved_decoder/version"

Gem::Specification.new do |spec|
  spec.name          = "ved_decoder"
  spec.version       = VedDecoder::VERSION
  spec.authors       = ['Yicheng Zhou']
  spec.email         = ["zyc9012@gmail.com"]
  spec.description   = "VedDecoder is a decoder for the Google ved parameter"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/serpapi/ved_decoder"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"
  spec.require_paths = ["lib"]
  spec.files         += Dir.glob("lib/**/*.rb")
  spec.add_dependency "google-protobuf"
end
