=begin
P: Optionally allow the width to be set at the initialization of a new banner object.
R:
  minimum banner width is 5 - 4 border pieced and char
  max is 80 - 4 border pieces and 76 chars

Approach: Iterate through the message, inputting line breaks at strategic locations.
Algo:
  INIT a new array
  SPLIT the message into an array of words

  INIT a counter to 0
  ITERATE through the split array
    increase the counter by the size of the current word
    If the counter is less than the allowed length on a line
      Push the word into the array
      push a space into the array
    else
      push a new line into the array
      Push the word into the array
      reset counter to the size of the current word
  JOIN the new array

  center each line
=end

class Banner

  def initialize(message, max_width = 80)
    @message = message
    @max_width = max_width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  BORDER_SIZE = 4

  attr_accessor :message, :max_width, :allowed_length
  
  # @@allowed_length = @max_width - BORDER_SIZE

  # def allowed_length
  #   @@allowed_length = max_width - BORDER_SIZE
  # end

  def horizontal_rule
    "+-#{'-'*@max_width}-+"
  end

  def empty_line
    "| #{' '*@max_width} |"
  end

  def message_line
    "| #{convert_message} |"
  end

  def convert_message
    new_array = []
    split_words = @message.split(" ")

    counter = 0
    split_words.each do |word|
      counter += word.size
      if counter < @max_width - BORDER_SIZE
        new_array << word
        new_array << ' '
      else
        new_array << "\n"
        new_array << word
        new_array << ' '
        counter = word.size
      end
    end
    new_array.join
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 30)
puts banner

# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# banner = Banner.new('')
# puts banner

# +--+
# |  |
# |  |
# |  |
# +--+