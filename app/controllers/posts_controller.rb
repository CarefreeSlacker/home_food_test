class PostsController < ApplicationController
	def index
		@posts = Post.visible(current_user).paginate(page: params[:page])
	end

	def new
		@post = Post.new
	end

	def create
		@post_creator = PostCreatorService.new(params[:commit], post_params)
		if @post_creator.submit
			redirect_to posts_path
		else
			@post = @post_creator.post
			render 'new'
		end
	end

	private

	def post_params
		params.require(:post).permit(:name, :text, :publish_date, category_ids: []).merge(user_id: current_user.id)
	end
end
