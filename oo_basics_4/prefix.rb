# class Person
#   attr_reader :name

#   def name=(name)
#     # my answer
#     # @name = 'Mr.' + " " + name
#     # LS answer
#     @name = "Mr. #{name}"
#   end
# end

class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name