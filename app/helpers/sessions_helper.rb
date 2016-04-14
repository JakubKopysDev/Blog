module SessionsHelper

  # Logs in admin.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Returns the current logged-in admin (if any).
  def current_admin
    @current_admin ||= Admin.where(id: session[:admin_id]).last
  end

  def logged_in?
    !current_admin.nil?
  end

  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
end
