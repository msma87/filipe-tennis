module Admin
  class BaseController < ApplicationController
    include AuthenticationConcern
    include AdminAuthorization
    layout 'admin'
  end
end
