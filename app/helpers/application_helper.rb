module ApplicationHelper
  def rolname(current_role)
    if current_role[0] != "Администратор"
      current_role[0] + " " + current_role[1]
    else
      current_role[0]
    end
  end
end
