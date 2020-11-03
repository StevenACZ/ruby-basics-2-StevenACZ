# Ask the user for the key and plaintext

# Create the ciphertext. You will need to iterate over each character of plaintext.
# On each character check if is an alphabetic letter. If you have a list of the alphabetic letters
# you cancheck if the character is included in that list. If not, it goes directly to the ciphertext
# You can also use that alphabetic list to find the letter that is some position after it.
# Do not forget that you should preserve the case of the original letter.
# Append the new letter to the ciphertext.

# Finally print the ciphertext to the screen.

class String
  def letter?
    /[A-Za-z]/.match?(self)
  end
end

key = 0
ciphertext = ""

loop do
  print("Key: ")
  key = gets.to_i
  key.positive? && break
end

print("plaintext: ")
plaintext = gets.strip.to_s

abc = [*"a".."z", *"A".."Z"]

plaintext.split("").each do |l|
  current = l.letter? ? abc[(abc.find_index(l).to_i + key) % 52] : l
  ciphertext += (current == current.upcase) && (l == l.upcase) ? current.upcase : current.downcase
end

puts("ciphertext: #{ciphertext}")
