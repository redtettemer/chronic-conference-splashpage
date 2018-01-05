ActiveAdmin.register Guest do

  batch_action :mark_attending do |ids|
    Guest.find(ids).each do |g|
      g.update_attribute :attending, true
    end
    redirect_to collection_path, alert: "Done."
  end

  batch_action :mark_not_attending do |ids|
    Guest.find(ids).each do |g|
      g.update_attribute :attending, false
    end
    redirect_to collection_path, alert: "Done."
  end

end
