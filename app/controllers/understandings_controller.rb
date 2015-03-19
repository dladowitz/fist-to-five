class UnderstandingsController < ApplicationController
  def new
    @page_name = "Understanding"
    @user = current_user
    @subject = Subject.find params[:subject_id]
    @understanding = Understanding.new

    @already_answered = already_answered?
  end

  def create
    @user = current_user
    @subject = Subject.find params[:subject_id]
    @understanding = @user.understandings.build understanding_params.merge(subject_id: @subject.id)

    if @understanding.save
      redirect_to subject_understanding_path(@subject, @understanding)
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

  def already_answered?
    @user.understandings.where(subject_id: @subject.id).any?
  end
end
