class FindRatingWorker
  include Sidekiq::Worker

  def perform(*args)
    products = Product.all
    products.find_each do |product|
      @assessment = 0
      if product.assessments.present?
        @assessments = product.assessments
        @assessments.each do |assessment|
          @assessment = @assessment.to_i + assessment.value
        end
        if @assessments.count > 0
          @assessment = @assessment.to_f / @assessments.count
        end
        product.update_attributes(:rating => @assessment)
      end
    end
  end
end
