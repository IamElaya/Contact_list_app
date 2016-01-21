require_relative 'contact.rb'
require_relative 'setup.rb'
require_relative 'new_contacts'
require 'active_record'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.


class ContactList < ActiveRecord::Base


  # has_many :contacts
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
      new_contact = Contact.create(name: name, email: email)
      p new_contact
    when "list"
      STDOUT.puts "List of all contacts."
      p Contact.all
    when "show"
      STDOUT.puts "Find a specific contact."
       # = gets.chomp
      id = STDIN.gets.chomp
      the_contact = Contact.find_by(id: id)
      p the_contact
      puts "Found contact with #{id}."
    when "search"
      STDOUT.puts "Searching for all contacts with specified term."
      term = STDIN.gets.chomp
      result = Contact.where("name LIKE ? OR email LIKE ?", "%#{term}%", "%#{term}%")
      p result
    when "update"
      STDOUT.puts "Update contact with new info"
      id = STDIN.gets.chomp
      the_contact = Contact.find_by(id: id)
      name = STDIN.gets.chomp
      the_contact.name = name
      email = STDIN.gets.chomp
      the_contact.email = email
      the_contact.save
      p the_contact
    when "destroy"
      STDOUT.puts "Destroy selected contact"
      id = STDIN.gets.chomp
      the_contact = Contact.find_by(id: id)
      the_contact.destroy
      p Contact.all
    else
      STDOUT.puts menu
    end

end

