# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts

  after_create :create_profile


  private

  def create_profile
    puts "id: #{id}, created_at: #{created_at}, self: #{self}"
    Profile.create(user_id: id)
  end
end
