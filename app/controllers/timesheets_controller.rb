class TimesheetsController < ApplicationController
	before_filter :require_login
  before_filter :disable_nav, only: [:search_record]
	
	def index
		# @time_sheets = TimeSheet.all
	end

	def new
		# @time_sheet = TimeSheet.new
		# respond_to do |format|
		# 	format.js{}
		# end
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
			render text: "ok"
		else
			@success = false
			render text: "failure"
		end
	end

	def edit
		@time_sheet = TimeSheet.find(params[:id])
	end


	 def update
    @time_sheet = TimeSheet.find(params[:id])
 
    if @time_sheet.update(time_sheet_params)
      redirect_to timesheets_path
    else
      render 'edit'
    end
  end

	def search_record
   @time_sheets = TimeSheet.where("Date(created_at) = ?", params[:created_at])
	end


	def show
		@time_sheet = TimeSheet.find(params[:id])
	end

	private
	def time_sheet_params
		params.require(:time_sheet).permit(:project_name, :description, :working_time)
	end
end

