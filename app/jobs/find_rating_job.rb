class FindRatingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    category = Category.new
    category.name = 'test'
    category.save
  end
end
