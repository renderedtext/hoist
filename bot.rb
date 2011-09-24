# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'scamp'
require 'yaml'

config = YAML.load_file("config.yml")
api_key = config["config"]["api_key"]

scamp = Scamp.new(:api_key => api_key, :subdomain => "renderedtext", :verbose => true)

scamp.behaviour do
  match "Hello!" do
    say "Hi there"
  end

  match "koliko je sati?" do
    say "Tačno je #{Time.now}"
  end
end

scamp.connect!(["rendered text"])
