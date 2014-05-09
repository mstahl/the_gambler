guard :bundler do
  watch('Gemfile')
end

guard 'rspec', cli: '--format progress --profile' do
  watch(%r{^spec/.+_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/.*\.rb$})
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch(%r{^spec/support/.*/.*.rb})
end
