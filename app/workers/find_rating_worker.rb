class FindRatingWorker
  include Sidekiq::Worker

  def perform(*args)
    products = Product.all
    products.find_each do |product|
      if product.assessments.present?
        @assessments = Assessment.all.where({product_id: product.id})
      end
      @assessments.find_each do |assessment|
        puts assessment.product.name
        @assessment = @assessment.to_i + assessment.value
        puts 'assessment = ', @assessment
      end
      puts 'count = ', @assessments.count
      if @assessments.count > 0
        @assessment = @assessment.to_f / @assessments.count
      end
      puts 'result = ', @assessment
      product.update_attributes(:rating => 0)
    end
  end
end
