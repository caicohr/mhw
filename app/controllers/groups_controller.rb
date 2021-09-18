class GroupsController < ApplicationController
  before_action :authenticate
  
  #loading group for these methods
  before_action :load_group, except: [:index, :new, :create]
  
  #Shows all instances
  def index
    @groups = current_user.groups
  end
  
  #Redirect to a from creation of a group instance 
  def new
    @group = Group.new
  end
  
  #Creating an instance
  def create
    @group = Group.new group_params
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: "Group created!"
    else
      render :new
    end
  end
  
  ###The instance will be loaded first before calling these methods
  #Show an instance
  def show
    @post = Post.new
  end
  
  #Edit an instance
  def edit
  end
  
  #Update an instance
  def update
    if @group.update group_params
      redirect_to @group, notice: "Group updated!"
    else
      render :edit
    end
  end
  
  #Delete an instance
  def destroy
    @group.destroy
    redirect_to groups_path, alert: "Group deleted!"
  end
  
  private
  
  def load_group
    @group = current_user.groups.find params[:id]
  end
  
  def group_params
    params.require(:group).permit(:name,:description,:image_url)
  end

end
