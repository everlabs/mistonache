module ApplicationHelper

  def title_helper
    base_name = 'Misto-na-4e'
    if content_for?(:title)
      content_for(:title) + ' | ' + base_name
    else
      base_name
    end
  end
end
