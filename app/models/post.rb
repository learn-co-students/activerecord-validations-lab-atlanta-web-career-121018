class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 200 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if title && title.match("Won't Believe" || "Secret" || "Top[number]" || "Guess")
      return true
    else
      errors.add(:clickbait, "Title is missing")
    end
  end
end
