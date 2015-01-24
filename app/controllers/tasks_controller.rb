class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]

	# GET /tasks
	# GET /tasks.json
	def index
		@tasks = Task.all
		if params[:tag]
			@tasks = @tasks.tagged_with(params[:tag])
		end
	end

	# GET /tasks/1
	# GET /tasks/1.json
	def show
	end

	# GET /tasks/new
	def new
		@list = List.find(params[:list_id])
		@task = @list.tasks.new
	end

	# GET /tasks/1/edit
	def edit
	end

	# POST /tasks
	# POST /tasks.json
	def create
		@list = List.find(params[:list_id])
		@task = @list.tasks.create(task_params)

		respond_to do |format|
			if @task.save
				format.html { 
					flash[:success] = "Task is successfully created"
					redirect_to @list
				 }
			else
				format.html { redirect_to @list, notice: 'Failed' }
			end
		end
	end

	# PATCH/PUT /tasks/1
	# PATCH/PUT /tasks/1.json
	def update
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])

		respond_to do |format|
			if @task.update(task_params)
				format.html { redirect_to @list, success: 'Task is successfully updated.' }
			else
				format.html { redirect_to @list, notice: 'Failed' }
			end
		end
	end

	# DELETE /tasks/1
	# DELETE /tasks/1.json
	def destroy
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])

		respond_to do |format|
			if @task.destroy
				format.html { redirect_to @list, notice: 'Task is successfully deleted.' }
			end
		end	
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_task
			@task = Task.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def task_params
			params.require(:task).permit(:description, :duedate, :tag_list)
		end
end
