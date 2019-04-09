class Chirp < ApplicationRecord
  has_many :comments
  validates :content, length: {minimum: 1, maximum: 141}

  # def posted_by
  #   puts "posted by #{@current_user.first_name}"
  # end

  def formatted_time
    created_at.strftime("%b %e, %l:%M %p")
  end
end
