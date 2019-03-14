class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug_name)
    name = slug_name.gsub("-", " ")
    # name = "taylor swift"
    name_array = name.split(" ")
    name_array.map! do |name_part|
      name_part.capitalize
    end
    new_name = name_array.join(" ")
    self.find_by(name: new_name)
  end

end
