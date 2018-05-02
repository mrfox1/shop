module ResultsHelper
  def results?
    if @search_results.blank?
      content_tag(:h3, 'Ничего не найдено')
    end
  end
end
