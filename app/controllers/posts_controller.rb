class PostsController < ApplicationController
  before_action :authenticate
  before_action :load_group
  before_action :load_post, except: [:index, :new, :create]
  
  def index
    @posts = @group.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new post_params
    if @group.posts << @post
      redirect_to group_path(@group), notice: "Post created!"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update post_params
      redirect_to [@group,@post], notice: "Post updated!"
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to group_posts_path(@group)
  end
  
  private
  
  def load_group
    @group = current_user.groups.find params[:group_id] # /group/10/posts
  end
  
  def load_post
    @post = @group.posts.find params[:id]
  end
  
  def post_params
    params.require(:post).permit(:title,:detail,:rarity)
  end

end
