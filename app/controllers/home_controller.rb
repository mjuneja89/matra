class HomeController < ApplicationController
	
	def home
    @strips = Strip.all
  end
    
end
