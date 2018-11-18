module UsersHelper
  def name(current_user)
    if (current_user.second_name)
      sec = current_user.second_name
      name, oth = "", ""
      name = (current_user.first_name[0] + ".") if current_user.first_name.present?
      oth = (current_user.last_name[0] + ".") if current_user.last_name.present?
      sec + " " + name + oth
    end
  end
end
