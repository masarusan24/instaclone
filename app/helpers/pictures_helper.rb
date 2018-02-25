module PicturesHelper
  def choose_new_or_edit_picture
    if action_name == 'new' or action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end
end
