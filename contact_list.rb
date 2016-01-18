require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.


class ContactList

  def self.menu
        "Here is a list of available commands:
          new    - Create a new contact
          list   - List all contacts      
          show   - Show a contact  
          search - Search contacts"
  end

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`. 
    # user = ARGV.first
    # prompt = '> '


    case ARGV[0]
    when "new"
      STDOUT.puts "Creating new user, please put input."
      name = STDIN.gets.chomp 
      email = STDIN.gets.chomp
      Contact.create(name, email)
    when "list"
      STDOUT.puts "List of all contacts."
      Contact.all
    when "show"
      STDOUT.puts "Find a specific contact."
       # = gets.chomp
      id = STDIN.gets.chomp
      Contact.find(id)
      puts "Found contact with  #{id}."
    when "search"
      STDOUT.puts "Searching for all contacts with specified term."
      term = STDIN.gets.chomp
      Contact.search(term)
    else
      STDOUT.puts menu
    end

end

