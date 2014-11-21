module ApplicationHelper
  def big_logo?
    if current_page?(new_user_path) || current_page?(new_session_path)
      "logo"
    else
      "logo-small"
    end
  end
end
