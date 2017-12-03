class Interest
  include DataMapper::Resource

  property :id, Serial
  property :title, Text

  has n, :posts
end
