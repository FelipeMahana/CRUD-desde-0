class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.new
	end

	def create
		#asignacion individual
		# titulo = params[:post][:title]
		# contenido = params[:post][:content]
		#asignacion masiva(metodo priado)
		post = Post.new(post_params)
		if post.save
			redirect_to post, notice: "Se creo con exito"
		else
			redirect_to posts_new_path, notice: "no se pudo crear el post"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post, notice: 'El post se a actualizado con exito'
		else
			redirect_to edit_post_path(@post.id), notice: 'no se a podido actualizar el registro'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path, notice: 'Se a eliminado el registro con exito'
	end

	private
	def post_params
		#asignacion masiva//strong params 
		params.require(:post).permit(:title, :content)
	end
end
