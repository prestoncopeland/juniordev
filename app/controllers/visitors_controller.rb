class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]
   before_filter :authenticate_user!, only: [:edit, :update, :destroy, :index]
   before_filter :admin_only, only: [:edit, :update, :index, :destroy]

  def index
    @visitors = Visitor.all
  end

  def show
  end

  def new
    @visitor = Visitor.new
  end

  def edit
  end

  def create
    @visitor = Visitor.new(visitor_params)

      if @visitor.save
        MailingListSignupJob.perform_later @visitor
        redirect_to root_path, notice: 'Successfully subscribed to list.'
      else
        render :new
      end
  end

  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: 'Mailing list information successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Removed from mailing list.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:name, :email)
    end

    def admin_only
      unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
      end
    end

end
