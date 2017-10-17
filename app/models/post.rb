class Post < ActiveRecord::Base
    belongs_to :writer, class_name: "User",
                        foreign_key: "writer_id"  
    belongs_to :receiver, class_name: "User",
                        foreign_key: "receiver_id"
    has_many :replies
    has_many :likes
    has_many :users, through: :likes
  include SearchCop

  search_scope :search do
    attributes :content
    attributes :comment => ["comments.title", "comments.message"]
    attributes :author => "author.name"
  end    
    mount_uploader :imgfile, FakeUploader

end
