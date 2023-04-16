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

# Scopes und lokale Variablen

foo = nil
p1 = proc{|n| foo=n} # proc definieren in welcher foo gleich dem param gesetzt wird
p2 = proc{|n| foo+=n} # proc definieren in welcher foo gleich foo plus dem param gesetzt wird

foo = 5
p1.call 7 # foo = 7
p1.call 9 # foo = 9
p2.call 1 # foo = 9(foo) + 1

##

def foobar
  x = nil
  get = proc{x} # proc enthält x
  set = proc{|n| x = n} # proc setzt lokales x gleich param
  # procs merkern sich den context in welchem sie definiert wurden
  # also werden sie sich immer auf das gleiche x in dieser methode beziehen
  return get, set
end

# 1 und 2 werden weil es verschiedene methoden aufrufe sind
# mit unterschiedlichen contexten "initialisiert"
r1, w1 = foobar
r2, w2 = foobar
r1.call
w1.call(2) # wenn wir hier 1 = 2 setzen
r1.call # ist hier x in context 1 = 2
r2.call # aber hier ist x in context 2 immernoch nil

# Dinge einbinden

=begin
  include bindet alle methoden eines moduls in das aktuelle modul ein

  load führt ein ruby programm aus 

  require loads ein programm solange es nicht schon geladen ist
=end