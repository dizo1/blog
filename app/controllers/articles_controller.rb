class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_todo, only: [:show, :edit, :update, :destroy]
	#http_basic_authenticate_with name: "me", password: "password", except: [:index, :show]
 
	def index
		@articles = Article.all
	end

	def show
		
	end

	def new
		@article = Article.new
	end

	def edit
 		 
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			#format.html { redirect_to @article, notice: 'Article was successfully created.' }
		redirect_to @article
		#flash[:notice] = "article created successfully"
	else
		render 'new'
	end
	end

	def update
  		
 
  		if @article.update(article_params)
    		redirect_to @article
  	else
    	render 'edit'
  end
end

	def destroy
  		
  		@article.destroy
 
  		redirect_to articles_path
	end

	private
		def set_todo
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
