	class PagesController < ApplicationController


	  def index
		@task = params[:task]
		@api  =  params[:api]
		@assigne = params[:assigne]
		if(@task)
			asana(@task,@api,@assigne)
	  	end 
	  end

	  def about 
	  	#not yet
	  end 
	  
	end
