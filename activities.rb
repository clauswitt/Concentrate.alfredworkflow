items = `osascript ./list.scpt`.gsub(/activity /, '').gsub(/\n/, '').split(/. /).map { |item| {:title => item.to_s }}

xml = items.select {|item| item[:title].downcase.start_with?(ARGV[0].downcase) }.map { |item| "<item uid=\"activity\" arg=\"#{item[:title]}\"><title>#{item[:title]}</title><subtitle>Concentrate on #{item[:title]}</subtitle><icon>icon.png</icon></item>"}.join('')
puts "<items>#{xml}</items>"
