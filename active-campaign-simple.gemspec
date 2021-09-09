# encoding: utf-8
require File.expand_path('../lib/active-campaign-simple/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'active-campaign-simple'
  gem.summary = %q{Simple Ruby REST wrapper for the ActiveCampaign API}
  gem.description = 'Simple Ruby REST wrapper for the ActiveCampaign'
  gem.authors = ["Nathan Leavitt"]
  gem.email = ['nateleavitt@gmail.com']
  gem.license = 'MIT'
  # gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/nateleavitt/active-campaign-simple'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 3.0.0')

  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_dependency 'rest-client', '~> 2.1'

  gem.version = ActiveCampaign::VERSION.dup
end