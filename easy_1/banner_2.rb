=begin
PROBLEM:

Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

EXAMPLES - 
If the width is too wide:
Size of the string, size of the width
if the width is even and 
+--------------------------------------------------+
|                                                  |
|    To boldly go where no one has gone before.    |
|                                                  |
+--------------------------------------------------+
DS - 
ALGO - 
CODE -
=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    # "+-" + ("-" * @message.size) + "-+"
    "+-#{"-" * @message.size}-+"
  end

  def empty_line
    # "| " + (" " * @message.size) + " |"
    "| #{" " * @message.size} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner

=begin
+--+
|  |
|  |
|  |
+--+
=end