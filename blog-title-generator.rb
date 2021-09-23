class BlogTitleGenerator
  def initialize(topic, qty)
    @topic = topic
    @qty = qty

  end

  def create_title
    titles = all_titles.sample @qty.to_i

    titles.each do |title|
      puts title.gsub! "{topic}", @topic
    end

  end

  def all_titles
    ["5 ways to become the BEST at {topic}",
      "12 facts you didn't know about {topic}",
      "7 amazinng tips to improve your {topic} skills",
      "8 life hacks can make you better at {topic}",
      "{topic} the ultimate guide for beginners"
    ]
  end

end

# pass in a noun
puts "Please enter your topic"
topic = gets.chomp

puts "Please enter your qty"
qty = gets.chomp.to_s

generator = BlogTitleGenerator.new(topic, qty)
generator.create_title
