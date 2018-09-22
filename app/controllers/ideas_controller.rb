class IdeasController < ApplicationController

	before_action :set_idea, only: [:show, :edit, :update, :destroy, :vote_up!]

	def index
		@ideas = Idea.all
	end

	def new
		@idea = Idea.new
	end

	def edit
		set_idea
	end

	def show
		set_idea
	end

	def create
		@idea = Idea.new(idea_params)
		@idea.votes = 0
		if @idea.save
			redirect_to ideas_path
		else
			render :new
		end
	end

	def update
		set_idea
		@idea.update(idea_params)

		redirect_to idea_path(@idea)
	end

	def upvote
		set_idea
		if @idea.votes.nil?
			@idea.votes = 1
		else
			@idea.votes += 1
		end
		@idea.save

		redirect_to ideas_path
	end

	private

	def set_idea
		@idea = Idea.find(params[:id])
	end

	def idea_params
	    # *Strong params*: You need to *whitelist* what can be updated by the user
	    # Never trust user data!
	    params.require(:idea).permit(:title, :text, :votes)
	end
end
