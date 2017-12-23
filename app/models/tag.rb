class Tag
  include DataMapper::Resource
  property :id, Serial
  property :name, String

  has n, :links, :through => Resource

  def self.get_links_by_tag(tag)
    self.all(:name => tag).links
  end
end
  
