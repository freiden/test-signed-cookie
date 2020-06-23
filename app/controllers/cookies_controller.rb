class CookiesController < ApplicationController
  COOKIE_KEY = 'auth0|circe@example.org'.to_sym

  # GET /cookies
  # GET /cookies.json
  def index
    puts '>>>>>>>>> ' + cookies[COOKIE_KEY].inspect
    raise 'SignedCookieError' unless cookies[COOKIE_KEY]
  end
end
