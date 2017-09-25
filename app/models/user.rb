class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :guesses

  def total_guesses
    self.guesses.count
  end

  def full_score
    "#{self.score}/#{self.total_guesses}"
  end
end
