class WelcomeController < ApplicationController
  def welcome
    render template: "welcome/welcome"
  end
end
