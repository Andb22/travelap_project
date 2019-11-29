class Country

  attr_reader :id
  attr_accessor :name, :visited

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @visited = details['visited']
  end



end
