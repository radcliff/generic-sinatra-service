require_relative 'spec_helper'
require_relative '../service.rb'

describe Service do
  include Rack::Test::Methods

  def app
    Service
  end

  # describe '' do
  #   context '' do
  #     it '' do
  #     end
  #   end
  # end

end
