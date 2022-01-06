class User < ApplicationRecord
  require 'uri'

  validates :name, :email, :gender, :picture_source, presence: true
  validates :email, uniqueness: true

  enum gender: { male: 0, female: 1 }

  scope :without_picture, -> { reject { |u| u.picture.attached? } }

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
    end
  end
end
