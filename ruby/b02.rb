class Tree
  class Node
    attr_accessor :children, :value
    @children = []
    def initialize(value)
      @value = value
    end

    def visit
      print @value
    end

    def visit_children
      visit
      print ": {"
      children.each do |node| 
        node.visit_children;
      end
      print "}, "
    end
  end

  def initialize(hash)
    @tree = create_tree hash
  end

  def create_tree(hash)
    tree = []
    hash.each do |node, children|
      leaf = Node.new node
      leaf.children = create_tree children
      tree.push leaf
    end
    return tree
  end

  def visit_all
    @tree[0].visit_children
  end
end

hash = {"grandpa" => { "dad"   => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} } } }
t = Tree.new hash
t.visit_all


### !


class CSV
  class CSVRow
    def initialize(headers, values)
        @headers = headers
        @values = values
    end

    def method_missing(column)
      column = column.to_s
      index = @headers.index column
      return @values[index] if index
      puts "column #{column} doesnt exist"
      return nil
    end
  end

  def initialize(filepath)
    raise "FILE DOES NOT EXIST" unless File.exist? filepath
    @path = File.new filepath
  end
  
  def each
    file = File.open @path
    headers = file.readline.strip.split(",")
    file.each_line do |line|
      yield CSVRow.new headers, line.strip.split(",")
    end
    file.close
  end
end

csv = CSV.new("file.csv")
csv.each {|row| puts row.zwei}


### !


