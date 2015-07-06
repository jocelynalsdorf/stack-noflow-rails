class AnswersController <  ApplicationController
before_filter :authorize, only: [:create, :edit, :update]

end
