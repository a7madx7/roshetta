class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def get_images_for(item, o, l = 3, f = 'png')
    # d = Drug.first; d.image = ''; d.save; exit
    `googleimagesdownload -k #{item} -o #{o} -l #{l} -f #{f}`
  end
end
