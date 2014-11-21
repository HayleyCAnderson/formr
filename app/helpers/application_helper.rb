module ApplicationHelper
  def big_logo?
    if signing_up? || signing_in? || logged_out?
      "logo"
    else
      "logo-small"
    end
  end

  private

  def signing_up?
    current_page?(new_user_path)
  end

  def signing_in?
    current_page?(new_session_path)
  end

  def logged_out?
    current_page?(root_path) && current_user == nil
  end
end
