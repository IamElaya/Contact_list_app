require 'csv'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email, :all, :create, :find, :search

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database. 
  class << self


    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('contacts.csv') do |row|
        puts row.inspect
      end
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      CSV.open('contacts.csv', 'a+') do |csv, id|
        size = csv.readlines.size
        if size == 0 
          id = 1
        else 
          id = size + 1
        end
        csv << [id, name, email] 
        puts "New contact #{name} with #{email} has been added as id number #{id}."
      end
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach('contacts.csv') do |row|
        if row.include?(id.to_s)
          puts row
        end
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
     CSV.foreach('contacts.csv') do |row|
      if row.select{|array| array.include?(term)}
        puts row
      end
    end
  end
end
end
