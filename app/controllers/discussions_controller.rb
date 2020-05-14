class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show]
  before_action :authenticate, except: [:index, :show]

  # GET /discussions
  # GET /discussions.json
  def index
  
    @discussions = Discussion.all
	if params[:search]
    @discussions = Discussion.search(params[:search]).order("created_at DESC")
  else
    @discussions = Discussion.all.order("created_at DESC")
  end
	
  end
  

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end
  
def recommended

@discussion = Discussion.new
end
  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
    @discussion = current_user.discussions.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = current_user.discussions.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'discussion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discussion }
      else
        format.html { render action: 'new' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    @discussion = current_user.discussions.find(params[:id])
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = current_user.discussions.find(params[:id])
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :location, :excerpt, :body, :published_at, :category_ids => [])
    end

end