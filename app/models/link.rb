require_relative 'tag'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :title, String
  has n, :tags, :through => Resource

  def add_tags
    tag_arr = tag_tr.split(",").map!{|i| i.gsub(" ", "")}
    tag_arr.each{|tag| self.tags << Tag.first_or_create(name: tag)}
  end
end
