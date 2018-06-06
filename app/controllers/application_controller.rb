class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def create_dir
    dir_path = Rails.root.to_s + '/app/assets/images/downloads'
    if Dir.exist?(dir_path)
      false
    else
      Dir.mkdir(dir_path)
      true
    end
  end

  def get_images_for(item, o, l = 3, f = 'png')
    # d = Drug.first; d.image = ''; d.save; exit
    system("googleimagesdownload -o #{o} -l #{l} -f #{f} -k \"#{item}\"")
  end
end
