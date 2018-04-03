class FindRatingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'OK!'
  end
end
