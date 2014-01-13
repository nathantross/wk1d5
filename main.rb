require './shelter'
require './animal'
require './client'

shelter = Shelter.new("Steve", "Lassie")

def menu message
  puts `clear`
  puts "*** HappiTails Animal Shelter ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Add animal'
  puts '2 : Add client'
  puts '3 : Show adoptable animals'
  puts '4 : Adopt animal to client'
  puts '5 : Give up animal for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    puts "Enter animal info:"
    print "animals name:"; name = gets.chomp
    print "age:"; age = gets.chomp
    print "gender:"; gender = gets.chomp
    print "species:"; species = gets.chomp
    pring "toys"; toys = gets.chomp

    client.animals << Animals.new(name, age, gender, species, toys)
    message = "Added animal #{shelter.animals.last.number}"
  when "2"
    puts "Enter client info:"
    print "Client name:"; name = gets.chomp
    print "Number of children:"; children = gets.chomp
    print "Client's age"; age = gets.chomp
    puts "select client's new animal:"
    shelter.get_available_animals.each do |animals|
      puts "#{animals.number} "
    end
    print "#:"; requested_animals_number = gets.chomp
    selected_animals = (shelter.animals.select { |animals| animals.number == requested_animals_name}).first
    selected_animals.tenant = Client.new(name, phone, selected_animals)
    message = "Client #{selected_animals.tenant.name} moved into animals #{selected_animals.name}"
  when "3"
    available_animals = shelter.get_available_animals()
    message = "Show adoptable animals:\n"
    available_animals.each do |animal|
      message += animal.name + " "
    end
  when "4"
    message = "Adopt animal to client:\n"
    message += shelter.get_contact_list()
  when "5"
    message += shelter.get_contact_list()
  else
      message += "I don't understand ..."
  end
  choice = menu message
end
