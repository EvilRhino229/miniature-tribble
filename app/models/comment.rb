class Comment < ApplicationRecord
  belongs_to :chirp
  belongs_to :user
  validates :content, length: {minimum: 1, maximum: 141}
  def formatted_time
    created_at.strftime("%b %e, %l:%M %p")
  end
end
