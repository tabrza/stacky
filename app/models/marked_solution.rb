class MarkedSolution
include DataMapper::Resource

  property :id, Serial

  belongs_to :post

end
