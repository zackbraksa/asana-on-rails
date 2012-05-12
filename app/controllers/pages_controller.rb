	class PagesController < ApplicationController


	  def index
		@task = params[:task]
		@api  =  params[:api]
		if(@task)
			asana(@task,@api)
			@feedback = "Added!"
	  	end 
	  end

	  def about 
	  end 
	  
	end
