Dir[File.join(File.dirname(__FILE__), 'the_gambler', '**', '*.rb')].each {|f| puts f; require f}

module TheGambler
end
