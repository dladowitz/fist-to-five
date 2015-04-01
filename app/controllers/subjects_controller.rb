class SubjectsController < ApplicationController
  def index
    @page_name = "Subjects"
    @subjects = Subject.all.reverse
  end

  def new
    @page_name = "Create a Subject"
    @subject = Subject.new
  end

  def create
    @user = current_user
    @subject = current_user.subjects.build subject_params

    if @subject.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @page_name = "Student Understanding"
    @subject = Subject.find params[:id]
    @understandings = @subject.understandings
    @level_breakdown = @subject.breakdown
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
