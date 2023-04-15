# Methoden auf Listen
arr = *(0..9)
cut = arr.filter {|x| x > 5}
puts cut.to_s 
cut = arr.find_all {|x| x > 5}
puts cut.to_s 
cut = arr.reject {|x| x <= 5}
puts cut.to_s 

##

arr = *(0..9)
plus_two = arr.map {|x| x + 2}
puts plus_two.to_s
minus_two = arr.collect {|x| x - 2}
puts minus_two.to_s

##

arr = *(0..9)
even = arr.reduce {|count, x| x % 2 == 0 ? count + 1 : count }
puts even.to_s
even = arr.inject {|count, x| x % 2 == 0 ? count + 1 : count }
puts even.to_s

##

arr = *(0..9)
any = arr.any? {|x| x == 2 }
puts any
all = arr.all? {|x| x == 2 }
puts all

# Fingerübungen: Stringersetzungen, Ranges, Codeblöcke

(1..10).each {|x| puts "Das ist Satz Nr. #{x}"}

##

str = ""
(0..12).filter {|x| (x + 1) % 3 == 0}.each {|x| str = str + x.to_s + "," }
str = str[0..-2]
puts str

##

arr = *(1..16)
arr.each do |x| 
  if (arr.index x) != 0 && (arr.index x) % 4 == 0
    print "\n"
  end
  print x.to_s + " "
end

# Ein- und Ausgabe, Stringmethoden

words = ["wuppie", "struppie", "fluppie"]
answer = words.sample
input = ""
# while input != answer
#   input = gets.chomp
# end
while !(input.include? answer)
  input = gets.chomp
end
puts "correct"

# Umgang mit File und RegExp
def my_grep(input)
  split_input = input.split(" ")
  search_term = ""
  if split_input[0] == "grep"
    search_term = split_input[1][1..-2]
    puts "searching for #{search_term}"
    if File.exist? split_input[2]
      file = File.open split_input[2]
      lines = file.readlines.map &:chomp
      file.close
      lines.each_with_index do |line, index|
        puts "#{index}: #{line}" if line =~ /\b#{search_term}\b/
      end
    end
  end
end

my_grep(gets.chomp)



