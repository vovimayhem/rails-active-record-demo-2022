# frozen_string_literal: true

# Base controller used to handle web requests
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
