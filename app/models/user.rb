class User < ApplicationRecord
  require 'uri'

  validates :name, :email, :gender, :picture_source, presence: true
  validates :email, uniqueness: true

  enum gender: { male: 0, female: 1 }

  mount_uploader :picture, PictureUploader

  scope :by_name, ->(name) { where(arel_table[:name].matches("%#{name}%")) }

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

      download_pictures
    end

    def download_pictures
      User.all.each do |u|
        u.remote_picture_url = u.picture_source
        u.save!
      end
    end
  end
end
