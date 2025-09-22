module Dashboard
  class BaseController < ApplicationController
    before_action :authenticate_user!   # ensures user must be signed in

    # optional: restrict access further or define common methods
  end
end
