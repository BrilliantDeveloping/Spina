module Spina
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    include ApplicationHelper

    private
    
    def after_sign_in_path_for(resource)
      spina.admin_root_url
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    def current_theme
      @current_theme = ::Spina.themes.detect{|theme| theme.name == current_account.theme }
    end
    helper_method :current_theme

    def current_account
      @current_account ||= Account.first
    end
    helper_method :current_account
  end
end
