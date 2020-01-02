class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  #before_save is called after validation occurs. So Rails goes is valid? "Nope! Stop!", and never #makes it to before_save
  #before_save :make_title_case
  before_validation :make_title_case #This one happens before validation. title cases the title, #then the validation runs

  # before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end