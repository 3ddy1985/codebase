class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
  
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
        format.json { render json: { success: true, post: @post }, status: :created }
        format.any { head :not_acceptable }
      else
        render json: { errors: @post.errors.full_messages }
      end
    end
  end

  def edit
  @post = current_user.posts.find(params[:id])
  if params[:post].present?
    if @post.update(post_params)
        format.html { redirect_to root_path }
        format.json { render json: { success: true, post: @post }, status: :created }
        format.any { head :not_acceptable }
    else
      render :edit_post_form
    end
  end
end

def edit
  @post = Post.find(params[:id])
  respond_to do |format|
    format.html { render 'home/_edit_post_form' }
    format.json { render json: @post }
  end
end


  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update(post_params)
      redirect_to root_path
    else
      render :create_post_form
    end
  end
  
  
  
  def destroy
    @post =current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post deleted successfully."
  end
  

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end




  
