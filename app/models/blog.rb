# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  featured   :boolean          default("f")
#  publish    :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :author, class_name: 'User'

  validates :title, :content, presence: true
end
