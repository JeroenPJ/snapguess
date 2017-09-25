class GuessesController < ApplicationController
  before_action :set_guess, only: [:edit, :update]
  before_action :set_category, only: [:create, :update]

  def new
    @categories = Category.all

    @redirect = :create
  end

  def create
    @guess = Guess.create(category: @category, user: current_user)

    redirect_to edit_guess_path(@guess)
  end

  def update
    if @guess.answer.nil? || @guess.answer == @category
      @user = current_user
      @guess.update(answer: @category) if @guess.user == @user

      if @guess.category == @guess.answer
        # success! increase user score
        @user.update(score: @user.score + 1)

        redirect_to correct_path
      else
        # wrong answer
        redirect_to incorrect_path
      end
    else
      render plain: "Ja uh dat mag dus niet hè, een beetje proberen je score te verhogen door de antwoorden van oude guesses te editen. Wel leuk geprobeerd hoor"
    end
  end

  def edit
    @categories = Category.all

    @redirect = :update
  end

  def destroy
  end

  def index
  end

  private

  def set_guess
    @guess = Guess.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
