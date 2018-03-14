str = "[()[]{({})()}]"
array = []
brackets = { "{"=> "}", "(" => ")", "["=>"]"}
str.each_char do |element|
  if brackets.keys.include?(element)
    array.push(element)
  elsif brackets.values.include?(element) && array.last == brackets.key(element)
    array.pop
  else
    break
  end
end
if array.empty?
  puts "Valid String"
else
  puts "Invalid String"
end