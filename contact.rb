require 'active_record'

# Represents a person in an address book.
class Contact < ActiveRecord::Base

  belongs_to :contact_list


end
