class Guess < ApplicationRecord
  belongs_to :category
  belongs_to :answer, class_name: "Category", foreign_key: 'answer_id', optional: true
  belongs_to :user

  validates :answer, presence: true, unless: :skip_answer_validation?

  def skip_answer_validation?
    true
  end
end
