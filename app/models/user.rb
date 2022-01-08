class User < ApplicationRecord
  require 'uri'

  validates :name, :email, :gender, presence: true
  validates :email, uniqueness: true

  enum gender: { male: 0, female: 1 }

  mount_uploader :picture, PictureUploader

  scope :by_name, ->(name) { where(arel_table[:name].matches("%#{name}%")) }
  scope :pending_download, -> { select { |u| !u.picture_source.nil? && u.picture.file.nil? } }

  class << self
    def bulk_create_from_response(entries)
      users = []

      entries.each do |e|
        users << { name: e[:name][:first] + ' ' + e[:name][:last],
                   gender: genders[e[:gender].to_sym],
                   email: e[:email],
                   picture_source: e[:picture][:large] }
      end

      insert_all users

      PictureDownloadWorker.perform_bulk(User.pending_download.pluck(:id).each_slice(1).to_a)
    end
  end
end
