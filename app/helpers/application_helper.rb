module ApplicationHelper

  def title_helper
    base_name = 'Mісто на "Че"'
    if content_for?(:title)
      content_for(:title) + ' | ' + base_name
    else
      base_name
    end
  end
end
