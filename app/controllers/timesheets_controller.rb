class TimesheetsController < ApplicationController
	before_filter :require_login
	
	def index
	end

	def new
		@time_sheet = TimeSheet.new
		respond_to do |format|
			format.js{}
		end
	end

	def create
		@time_sheet = TimeSheet.new(time_sheet_params)
		if @time_sheet.valid?
			@time_sheet.save
			@success = true
			respond_to do |format|
				format.html{ redirect_to timesheets_path }
			end
		else
			@success = false
			render 'new'
		end
	end

	def autosave
		@time_sheet = TimeSheet.new(time_sheet_params)
		if @time_sheet.valid?
			@time_sheet.save
			@success = true
			respond_to do |format|
				format.html{ redirect_to timesheets_path }
			end
		else
			@success = false
			render 'new'
		end
	end

	def show
		@time_sheet = TimeSheet.find(params[:id])
	end

	private
	def time_sheet_params
		params.permit(:project_name, :description, :working_time)
	end
end

