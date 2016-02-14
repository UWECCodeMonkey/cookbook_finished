ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_working_associations(m=nil)
    m ||= self.class.to_s.sub(/Test$/, '').constantize
    @m = m.new
    m.reflect_on_all_associations.each do |assoc|
      assert_nothing_raised("#{assoc.name} caused an error") do
        @m.send(assoc.name, true)
      end
    end
    true
  end
  private 
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
      request.env['HTTP_AUTHORIZATION'] = credentials
    end
  
end
