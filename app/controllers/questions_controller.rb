class QuestionsController <  ApplicationController
before_filter :authorize, only: [:create, :edit, :update]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question saved"
      redirect_to questions_path
    else
      render :new
  end
end


  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
     redirect_to @question, notice: "Question has been updated"
   else
     render :edit
   end
  end

private
def question_params
  params.require(:question).permit(:title, :content, :user_id)
end
end
