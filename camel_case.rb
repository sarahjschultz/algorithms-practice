# Enter your code here. Read input from STDIN. Print output to STDOUT

def convert_input(input)
  instructions = input.split(";")
  action       = instructions[0]
  type         = instructions[1]
  target       = instructions[2]

  result = if action == "C" #combine
             words = target.split
             case type
             when "C"
               words.map(&:capitalize).join
             when "M"
               first       = words.shift
               capitalized = words.map(&:capitalize)
               [first].concat(capitalized).concat(["()"]).join
             when "V"
               first       = words.shift
               capitalized = words.map(&:capitalize)
               [first].concat(capitalized).join
             end
           else
             #split
             words = target.split(/(?=[A-Z])/)
             words.map { |w| w.gsub(/[()]/, "") }.map(&:downcase).join(" ")
           end
  result
end

def handle_input(stream)
  instructions = stream.rstrip
  convert_input(instructions)
end

output = []

test_string = "C;V;can of coke
S;M;sweatTea()
S;V;epsonPrinter
C;M;santa claus
C;C;mirror"

test_string.split("\n").each do |a|
  output << handle_input(a)
end

puts output.join("\n")
