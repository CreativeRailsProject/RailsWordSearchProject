class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO: Replace test fucntion with Code to Generate word search in here
  def test
	puts "hi"
  end
end
