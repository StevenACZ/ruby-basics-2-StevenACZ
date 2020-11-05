contacts = {
  "Deyvi" => {
    "country" => "Peru",
    "email" => "deyvi@able.co",
    "phone" => "+52 987654321"
  },
  "Diego" => {
    "country" => "Peru",
    "email" => "diego@able.co",
    "phone" => "+51 987654321"
  },
  "Wences" => {
    "country" => "Mexico",
    "email" => "wenceslao@able.co",
    "phone" => "+51 9871236547"
  }
}

# Modify the file below this line
# --------------------------------------------------

# Srting
def srting
  print("Name: ")
  gets.to_s.strip
end

# Details
def details
  print("Country: ")
  country = gets.to_s.strip
  print("Email: ")
  email = gets.to_s.strip
  print("Phone: ")
  phone = gets.to_s.strip
  [country, email, phone]
end

# Display
def display(contacts)
  puts("All your contacts:")
  contacts.each do |k, _v|
    puts("- #{k}")
  end
end

# Add
def add(name, contacts)
  if contacts.key?(name)
    puts("Contact already exists")
  else
    new_details = details
    contacts[name] = {
      "country" => new_details[0],
      "email" => new_details[1],
      "phone" => new_details[2]
    }
  end
end

# Show
def show(name, contacts)
  if contacts.key?(name)
    contacts[name].each do |k, v|
      puts("- #{k}: #{v}")
    end
  else
    puts("Contact doesn't exist")
  end
end

# Update
def update(name, contacts)
  if contacts.key?(name)
    new_details = details
    contacts[name] = {
      "country" => new_details[0],
      "email" => new_details[1],
      "phone" => new_details[2]
    }
  else
    puts("Contact doesn't exist")
  end
end

# Delete
def delete(name, contacts)
  if contacts.key?(name)
    contacts.delete(name)
    puts("#{name} has been deleted")
  else
    puts("Contact doesn't exist")
  end
end

# Welcome
def welcome
  puts("#{'-' * 50}\nWelcome to Contacts\n#{'-' * 50}")
  puts("What would you like to do next?")
  puts("-- Type 'display' to display all contacts")
  puts("-- Type 'add' to add a contact")
  puts("-- Type 'show' to show the details of a contact")
  puts("-- Type 'update' to update a contact")
  puts("-- Type 'delete' to delete a contact")
  puts("-- Type 'exit' to exit the program")
  print("action: ")
end

# Next step
def next_step
  puts("--------------------------------------------------")
  puts("What would you like to do next?")
  print("action: ")
end

n_loop = 0
until n_loop.zero? ? welcome : next_step
  action = gets.to_s.strip
  case action
  when "display"
    puts("-" * 50)
    display(contacts)
  when "add"
    name = srting
    puts("-" * 50)
    add(name, contacts)
  when "show"
    name = srting
    puts("-" * 50)
    show(name, contacts)
  when "update"
    name = srting
    puts("-" * 50)
    update(name, contacts)
  when "delete"
    name = srting
    puts("-" * 50)
    delete(name, contacts)
  when "exit"
    puts("Bye!")
    break
  else
    puts("-" * 50)
    puts("Invalid action")
  end
  n_loop += 1
end
