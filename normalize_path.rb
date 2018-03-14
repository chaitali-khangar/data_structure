path_o = "/abc/def/../../../"#"/path/to/the/./first/../next/directory/../folder"
paths = path_o.split("/").reject{|element| element.empty?}
new_path = []
paths.each do |element|
  next if element == "."
  if element != ".."
    new_path.push(element)
  elsif element == ".."
    new_path.pop
  end
end
puts new_path.join("/")