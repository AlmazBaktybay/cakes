class ProfileController < ApplicationController
	before_action :set_profile, only:[:edit, :show, :update, :destroy]

	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile  = Profile.new(profile_params)
		if @profile.save
			flash{:notice} = "Profile was created successfully"
			redirect_to profile_path(@profile)
		else
			render 'new'
		end
	end

	def update
	end

	def show
	end

	def destroy
		@profile.destroy
		flash[:notice] = "Profile deleted"
		redirect_to profile_path
	end

	private
	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:guide).permit()
	end

end