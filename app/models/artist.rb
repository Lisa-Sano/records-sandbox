class Artist < ActiveRecord::Base
  validates :name, presence: true
  has_many :albums

  before_create :normalize_name

  # why put this in the model? 
  # It's about model data.  it's about the model's name
  # we know how to test it when it's in a model and not in a controller, view, etc
  def display_name
    return "" if name.nil?

    # converts "The Clash" to "Clash, The"
    return name unless name[0,4] == "The "
    # name is a method provided by an accessor that rails provides

    name.gsub(/^The\s+/, '') + ', The'
  end

  private

  # don't care about the return value, because this isn't about displaying anything
  def normalize_name
    if self.name[0, 4] == 'The '
      self.name = self.name.gsub(/^The\s+/, '') + ', The'
    end
  end
end
