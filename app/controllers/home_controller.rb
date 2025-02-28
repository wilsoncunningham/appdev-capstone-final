class HomeController < ApplicationController

  def index
    render({:template => "home"})
  end

  def login
    render({:template => "/credentials/login"})
  end

  def test_credentials
    redirect_to("/books")
  end
end
