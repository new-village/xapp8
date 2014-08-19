class MainsController < ApplicationController
  #ログインしているかどうか確認
  before_filter :authenticate_user!
  before_action :set_main, only: [:show, :edit, :update, :destroy]

  # GET /mains
  # GET /mains.json
  def index
    @main = Main.where(:user_id => current_user.id, :read_flg => 0)
  end

  # GET /mains/1
  # GET /mains/1.json
  def show
  end

  # GET /mains/new
  def new
    @main = Main.new
  end

  # GET /mains/1/edit
  def edit
    flash[:success] = "Profile updated"
  end
  
  # POST /mains
  # POST /mains.json
  def create
    @main = Main.new(main_params)

    respond_to do |format|
      if @main.save
        format.html { redirect_to @main, notice: 'Main was successfully created.' }
        format.json { render action: 'show', status: :created, location: @main }
      else
        format.html { render action: 'new' }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mains/1
  # PATCH/PUT /mains/1.json
  def update
    flash[:notice] = "Post successfully created"
    redirect_to root_path
  end

  # DELETE /mains/1
  # DELETE /mains/1.json
  def destroy
    @main.destroy
    respond_to do |format|
      format.html { redirect_to mains_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main
      @main = Main.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_params
      params.require(:main).permit(:user_id, :page_id, :read_flg)
    end
  
end