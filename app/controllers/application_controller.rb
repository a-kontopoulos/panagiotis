class ApplicationController < ActionController::Base

  #this is to set the locale
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # Permitted locales available for the application
    I18n.available_locales = [:en, :gr, :ru]
  end

  def default_url_options
    { locale: I18n.locale }
  end


end
