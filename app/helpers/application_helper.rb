module ApplicationHelper
  def icons_list
    ['✈️', '📊', '⚽', '🍔', '🍪', '💳', '🍕', '🍎', '☕️', '⛱️', '💰']
  end

  def index_page?
    controller_name == 'users' && action_name == 'index'
  end
end
