class	Admin::BaseController< ApplicationController
	before_filter :authorize_admin!

	def index
		
	end

	private

	 def authorize_admin!
        authenticate_user!
        unless current_user.admin?
          flash[:alert] = "You are not a admin"
          redirect_to root_path
        end      
    end
end