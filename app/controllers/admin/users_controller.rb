class Admin::UsersController < Admin::BaseController
  def index
  	@users = User.all(:order => "email")
  end

  def new
  	@user = User.new
  	
  end

  def create
  	@user = User.new(params[:user])
  	@user.admin = params[:admin_field] == "1"
	if @user.save
		flash[:notice] = "User Created"
	  	redirect_to admin_users_path	
	 else
	  	flash[:alert] = "User Creation Fail"
	  	render 'new'	
	end  	
  end
end
