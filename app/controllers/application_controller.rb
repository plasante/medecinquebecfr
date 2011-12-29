class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end
  
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
