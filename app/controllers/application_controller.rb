class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :set_locale

  def set_locale
    I18n.locale = session[:locale] || :pl
  end

  def change_locale
    locale = params[:locale].to_s

    if I18n.available_locales.map(&:to_s).include?(locale)
      session[:locale] = locale
    end

    redirect_to request.referer.presence || root_path
  end
end
