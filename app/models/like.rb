class Like
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :comment
  belongs_to :post

end
