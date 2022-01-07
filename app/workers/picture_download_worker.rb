class PictureDownloadWorker
  include Sidekiq::Worker

  def perform(id)
    user = User.find id
    user.remote_picture_url = user.picture_source
    user.save!
  end
end
