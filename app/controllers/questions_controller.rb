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

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
     redirect_to @question, notice: "Question has been updated"
   else
     render :edit
   end
  end

end
