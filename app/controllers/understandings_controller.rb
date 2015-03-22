class UnderstandingsController < ApplicationController
  def new
    @page_name = "Understanding"
    @user = current_user || User.new
    @subject = Subject.find params[:subject_id]
    @understanding = Understanding.new

    @already_answered = @user.already_answered?(@subject)
  end

  def create
    @user = current_user || User.new
    @subject = Subject.find params[:subject_id]
    @understanding = Understanding.new subject_id: @subject.id, user_id: @user.id, level: params[:id]

    if @understanding.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  def show
    @subject = Subject.find params[:subject_id]
    @understanding = Understanding.find params[:id]
  end

  private

  def understanding_params
    params.require(:understanding).permit(:level, :subject_id)
  end
end
