class HomeController < ApplicationController
  layout :home.html.erb
  def home
    @ingredients  = params[:ingredients]
    
  end
  
  
  
  
end