class Student

# uses the data to instantiate new objects 
# use metaprogramming to instantiate new instances of a class and + attributes to instances of a class 

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each {|k,v| self.send( ("#{k}="), v)}
    #mass assignments for attributes, .send calls the method that is the key's name and w/ and argument of that value 
    # accepts some unspecified number and type of attributes
    @@all << self 
  end

  def self.create_from_collection(students_array)
    students_array.each {|name| self.new(name)} 
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each {|k,v| self.send( ("#{k}="), v)}
    #the only way to set additional/flexible attributes is to create the mass assignments method... less work on your end-- accommodating future change. 
  end

  def self.all
    @@all 
  end
end

