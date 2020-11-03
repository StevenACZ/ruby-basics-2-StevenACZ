# Contacts

The project "A Night at the Movies" from codecademy was interesting. Time to bring it to the next level. You will code a program to manage contacts information.

The name of the contact is their unique identifier and each contact have a country, email and phone number. The file `contact.rb` have already a data structure with some contacts information. It is a requisite to use that data structure as is, do not modify it in any way.

When the program is executed it should display a welcome message, a menu with the available and a prompt the user tu type an action.

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action:
```

Your program should be able to manage all the 6 actions.
Lets go through an example for each one.

### Display contacts

If the user type `display`, the program should print the subtitle "All your contacts:" followed by a list of all the contact names (hyphenated):

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: display
--------------------------------------------------
All your contacts:
- Deyvi
- Diego
- Wences
--------------------------------------------------
What would you like to do next?
action:
```

Notice that the program doesn't finish but prompt the user for another action. The program finishes only when the user type `exit`.

### Add a contact

If the user type `add`, the program should ask the user for a `Name`. If the name doesn't exist already, then the program should ask the user for the country, email and phone (one at a time):

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: add
Name: Juan
--------------------------------------------------
Country: Peru
Email: juan@mail.com
Phone: +51 987654321
--------------------------------------------------
What would you like to do next?
action:
```

If the Name already exist, a message is displayed:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: add
Name: Diego
--------------------------------------------------
Contact already exists
--------------------------------------------------
What would you like to do next?
action:
```

### Show a contact

If the user type `show`, the program should ask the user for a `Name`. If the name exists, then the program should display a list with the country, email and phone of the contact (hyphenated):

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: show
Contact name: Diego
--------------------------------------------------
- country: Peru
- email: diego@able.co
- phone: +51 987654321
--------------------------------------------------
What would you like to do next?
action:
```

If the Name doesn't exist, a message is displayed:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: show
Contact name: Otro Nombre
--------------------------------------------------
Contact doesn't exist
--------------------------------------------------
What would you like to do next?
action:
```

### Update a contact

If the user type `update`, the program should ask the user for a `Name`. If the name exists, then the program should ask the user new values for the country, email and phone (one at a time):

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: update
Contact name: Diego
--------------------------------------------------
country: New Country
email: new_mail@able.co
phone: +51 999000111
--------------------------------------------------
What would you like to do next?
action:
```

If the Name doesn't exist, a message is displayed:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: update
Contact name: Otro Nombre
--------------------------------------------------
Contact doesn't exist
--------------------------------------------------
What would you like to do next?
action:
```

### Delete a contact

If the user type `delete`, the program should ask the user for a `Name`. If the name exists, then the program should remove it and display a confirmation message:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: delete
Contact name: Diego
--------------------------------------------------
Diego has been deleted
--------------------------------------------------
What would you like to do next?
action:
```

If the Name doesn't exist, a message is displayed:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: delete
Contact name: Otro Nombre
--------------------------------------------------
Contact doesn't exist
--------------------------------------------------
What would you like to do next?
action:
```

### Exit de program

If the user type `exit`, the program should display a good bye message and exit.

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: exit
Bye!
$
```

> **Important** Surely you will use some type of infinite loop to keep your program open while the user type the actions. When the user types `exit`, use a simple `break` to exit the infinite loop a leet the program follow its course and finish by itself. DO NOT USE `exit`, `exit!` or `abort` or nothing else.

### Multiple actions

As I mentioned, the program doesn't finish after each action but continues. The following example it is nothing new, just an example of multiple actions executed one after the other. For example I will `display` all the contacts, then `add` a new contact, then `update` the same contact and finally `delete` it. After that I exit the program:

```
$ ruby contacts.rb
--------------------------------------------------
Welcome to Contacts
--------------------------------------------------
What would you like to do next?
-- Type 'display' to display all contacts
-- Type 'add' to add a contact
-- Type 'show' to show the details of a contact
-- Type 'update' to update a contact
-- Type 'delete' to delete a contact
-- Type 'exit' to exit the program
action: display
--------------------------------------------------
All your contacts:
- Deyvi
- Diego
- Wences
--------------------------------------------------
What would you like to do next?
action: add
Name: Juan
--------------------------------------------------
Country: Chile
Email: juan@chile.com
Phone: 876293828
--------------------------------------------------
What would you like to do next?
action: update
Contact name: Juan
--------------------------------------------------
country: Peru
email: new@juan.com
phone: 999111666
--------------------------------------------------
What would you like to do next?
action: delete
Contact name: Juan
--------------------------------------------------
Juan has been deleted
--------------------------------------------------
What would you like to do next?
action: exit
Bye!
$
```
