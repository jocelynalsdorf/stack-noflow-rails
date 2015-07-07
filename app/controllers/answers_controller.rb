class AnswersController <  ApplicationController
before_filter :authorize, only: [:create, :edit, :update, :delete]
  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
	  @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
	  if @answer.save
	    flash[:notice] = "Answer added!!"
	    redirect_to question_path(@question)
	  else
	    render :new
	  end
	end


	def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question, @answer)
    else
      render :edit
    end
  end

   def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

end
