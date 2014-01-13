class shelter
  attr_accessor :client, :animals,

  def initialize(client, animals,)
    @client = client
    @animals = animals
  end

  def get_contact_list
    result = @animals.inject("") do |contact_list_str, animals|
      if not animals.orphan?
         contact_list_str << "#{animals.client.name} p#:#{animals.client.phone}"
      end
    end
    result || ""
  end
  def get_available_animals
    @animals.select do |animals|
        animals.orphan?
    end
  end

  def get_rented_animals
    return @animals.select do |animals|
      not animals.orphan?
    end
  end

end