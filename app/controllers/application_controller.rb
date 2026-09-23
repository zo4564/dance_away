class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale

  private

  def set_locale
    I18n.locale = locale
  end

  def locale
    requested_locale = params[:locale]&.to_sym

    if I18n.available_locales.include?(requested_locale)
      requested_locale
    else
      I18n.default_locale
    end
  end
end
