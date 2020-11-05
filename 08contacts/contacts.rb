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

n_loop = 0
loop do
  if n_loop == 0
    puts("--------------------------------------------------")
    puts("Welcome to Contacts")
    puts("--------------------------------------------------")
    puts("What would you like to do next?")
    puts("-- Type 'display' to display all contacts")
    puts("-- Type 'add' to add a contact")
    puts("-- Type 'show' to show the details of a contact")
    puts("-- Type 'update' to update a contact")
    puts("-- Type 'delete' to delete a contact")
    puts("-- Type 'exit' to exit the program")
    print("action: ")
    action = gets.to_s.strip
  else
    puts("--------------------------------------------------")
    puts("What would you like to do next?")
    print("action: ")
    action = gets.to_s.strip
  end
  
  case action
    when "display"
      puts("--------------------------------------------------")
      puts("All your contacts:")
      contacts.each do |k, _v|
        puts("- #{k}")
      end
    when "add"
      print("Name: ")
      name = gets.to_s.strip

      if contacts.key?(name)
        puts("--------------------------------------------------")
        puts("Contact already exists")
      else
        puts("--------------------------------------------------")
        print("Country: ")
        country = gets.to_s.strip
        print("Email: ")
        email = gets.to_s.strip
        print("Phone: ")
        phone = gets.to_s.strip

        contacts.merge!({name => {
          "country" => country,
          "email" => email,
          "phone" => phone
        }})
      end
    when "show"
      print("Contact name: ")
      name = gets.to_s.strip
      
      if contacts.key?(name)
        puts("--------------------------------------------------")
        contacts[name].each do |k, v|
          puts("- #{k}: #{v}")
        end
      else
        puts("--------------------------------------------------")
        puts("Contact doesn't exist")
      end
    when "update"
      print("Contact name: ")
      name = gets.to_s.strip

      if contacts.key?(name)
        puts("--------------------------------------------------")
        print("Country: ")
        country = gets.to_s.strip
        print("Email: ")
        email = gets.to_s.strip
        print("Phone: ")
        phone = gets.to_s.strip

        contacts[name] = {
          "country" => country,
          "email" => email,
          "phone" => phone
        }
      else
        puts("--------------------------------------------------")
        puts("Contact doesn't exist")
      end
    when "delete"
      print("Contact name: ")
      name = gets.to_s.strip

      if contacts.key?(name)
        contacts.delete(name)
        puts("--------------------------------------------------")
        puts("Diego has been deleted")
      else
        puts("--------------------------------------------------")
        puts("Contact doesn't exist")
      end
    when "exit"
      puts("Bye!")
      break
  end

  n_loop += 1
end
