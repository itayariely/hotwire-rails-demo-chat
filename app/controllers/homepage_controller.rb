class HomepageController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token, only: [:embed] #, if: :js_request?
  def index
    headers['X-Frame-Options'] = "ALLOWALL"
  end

  def embed
    respond_to do |format|
      format.js {}
    end
  end

  def test
    
  end
end
