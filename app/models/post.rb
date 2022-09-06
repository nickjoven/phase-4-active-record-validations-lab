class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :clickbaity?

    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        /Secret/,
        /Top \d/,
        /Guess/
    ]

  def clickbaity?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end


end
