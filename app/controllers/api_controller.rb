class ApiController < ApplicationController

  before_filter :set_default_response_format
  around_filter :error_handler

  respond_to :json

  private

  def set_default_response_format
    request.format = :json unless params[:format]=='json'
  end

  # Use for a correct errors processing
  def error_handler
    begin
      yield
    rescue => exception
      options = Rails.env.development? ? {:backtrace => exception.backtrace, :class => exception.class.to_s} : {}
      render_error(exception.message, options)
    end
  end

  def render_error(message, params={})
    options = {:status => :bad_request, :message => message}.merge(params)
    render :status => options.delete(:status), :json => {:error => options}.to_json
  end


end