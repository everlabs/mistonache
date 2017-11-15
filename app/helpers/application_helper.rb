module ApplicationHelper

  def title_helper
    base_name = 'Громадська ініціатива "Місто на "Че"'
    if content_for?(:title)
      content_for(:title) + ' | ' + base_name
    else
      base_name
    end
  end
end
