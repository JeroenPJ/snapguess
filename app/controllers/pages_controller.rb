class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def correct
  end

  def incorrect
  end

  def leaderboard
    @users = User.all.order(score: :desc)
  end
end
