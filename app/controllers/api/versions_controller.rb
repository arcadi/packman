class Api::VersionsController < ApiController
  CURRENT_VERSION = 1

  def show
    render :json => {:current_version => CURRENT_VERSION}.to_json
  end

end