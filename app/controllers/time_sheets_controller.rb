class TimeSheetsController < ApplicationController
	before_filter :require_login
	before_filter :disable_nav, only: [:search_record]
	
	def index
		@date = Date.today.strftime("%Y-%m-%d")
		@time_sheets = current_user.time_sheets.where(date: @date)
		@time_sheet = TimeSheet.new()
		@total_time = 0
		@time_sheets.each do |entry|
			@total_time += entry.working_time
		end
		@total = time_format(@total_time)
	end

	def new
	end

	def create
		@time_sheet = TimeSheet.new(time_sheet_params)
		@time_sheet.user_id = current_user.id
		@total_minutes = TimeSheet.saved_minutes(@time_sheet)
		if @time_sheet.valid? && @total_minutes < 1440
			@time_sheet.save
			@success = true
			respond_to do |format|
				format.js {}
			end
		else
			@time_sheets = current_user.time_sheets
			@success = false
			flash[:error] = "Exceeds 24 hours"
			render 'index'
		end
	end

	def edit
		@time_sheet = TimeSheet.find(params[:id])
	end

	def update
		@time_sheet = TimeSheet.find(params[:id])
		if @time_sheet.update(time_sheet_params)
			redirect_to time_sheets_path
		else
			render 'edit'
		end
	end

	def search_record
		@date = params[:date] || Date.today.strftime("%Y-%m-%d")
		@time_sheets = current_user.time_sheets.where(date: params[:date])
		render json: @time_sheets
	end


	def show
		@time_sheet = TimeSheet.find(params[:id])
	end

	private
	def time_sheet_params
		params.require(:time_sheet).permit(:project_name, :description, :working_time, :date)
	end

	def time_format(minutes)
		hours = minutes/60
		minutes = minutes%60
		"#{hours}:#{minutes}"
	end
	
end

