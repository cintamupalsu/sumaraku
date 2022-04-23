class RolesController < ApplicationController
  before_action :authenticate_user!
  def users
    if UserRoleTransaction.where("role_id = 1 AND user_id = ?", current_user.id)
      @users = User.all 
    else
      @users = nil
    end
  end

  def userrole
    @user = User.find(params['id'].to_i)
    @roles = UserRole.all
  end

  def updateroles
    checkbox = check_box_bug(updateroles_params['yaru'])
    user = User.find(updateroles_params['user_id'])
    roles = UserRole.all
    (0..checkbox.count-1).each do |counter|
      rt = UserRoleTransaction.where("user_id = ? AND role_id = ?", user.id, counter+1).first
      if checkbox[counter] == 1
        if rt == nil
          UserRoleTransaction.create(user_id: user.id, role_id: counter+1)
        end
      else
        if rt
          rt.destroy
        end
      end
      counter += 1
    end
    redirect_to usermanage_path
  end

  def destroyuser
    user = User.find(params['id'].to_i)
    if user != current_user && current_user.developer == 1 && user.id != 1
      user.destroy
    end 
    redirect_to usermanage_path
  end

  private
  def updateroles_params
    params.require(:update_roles).permit(:user_id, :yaru=>[])
  end
  def check_box_bug(param_checkbox)
    count_array=0
    result={}
    (0..param_checkbox.count-1).each do |i|
      if param_checkbox[i]=='1'
        count_array -= 1
        result[count_array]=1
        count_array += 1
      else
        result[count_array]=0
        count_array += 1
      end
    end
    return result
  end
end
