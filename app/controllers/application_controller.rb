class ApplicationController < ActionController::Base
  before_filter :set_locale
  #before_filter :set_title_header_footer
  
  protect_from_forgery
  
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end
  
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
  
  def set_title_header_footer
    symbol_title = self.controller_name + '_' + self.action_name + '_' + 'title'
    symbol_header = self.controller_name + '_' + self.action_name + '_' + 'header'
    symbol_footer = self.controller_name + '_' + self.action_name + '_' + 'footer'
    @title  = t( symbol_title.to_sym )
    @header = t( symbol_header.to_sym )
    @footer = t( symbol_footer.to_sym )
  end
end
