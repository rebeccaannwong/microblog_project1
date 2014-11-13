require 'active_record'

require_relative '../models/post.rb'
require_relative '../models/tag.rb'
require_relative '../models/user.rb'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'microblog_db',
	host: 'localhost'
})

names = [
	"Rebecca Ann Wong",
	"Daniel Sea",
	"Ariel Lim",
	"Maryanne Soh",
	"Ivan Sebastian Cheng"]

avatars = [
	"http://s12.postimg.org/e7sgl3nvg/rebecca.jpg", 
	"http://s9.postimg.org/n9lnj5ygf/dan.jpg", 
	"http://s2.postimg.org/u29c56bkp/ariel.jpg", 
	"http://s18.postimg.org/p07atz2yw/mary.jpg", 
	"http://s7.postimg.org/qcb1armmj/ivan.jpg"
]

date_joined = [
	"January 2013",
	"February 2013",
	"March 2013",
	"April 2013",
	"May 2013"
	]

location = [
	"Singapore",
	"New York",
	"Los Angeles",
	"Washington DC",
	"London"
	]

bio = [
	"Born in 1990",
	"DJ/Producer based in NYC",
	"I eat so much chocolate, my blood type is Nutella.",
	"Was always a dog person, but I've recently become a hybrid dog/cat person with my new kitty Tiki!",
	"I believe in the power of brands, technology, yoga, coffee, brunch, tequila and Beyonce."
]

title = [
	"Meeting Misty",
	"Sunsets",
	"Music",
	"SF",
	"New-old-school",
	"Soul Cycle",
	"Switching sides",
	"Coffee",
	"New York"
]

image = [
"http://s2.postimg.org/64hz7u4nt/misty.jpg",
"http://s23.postimg.org/r6k7h90sb/sunset.jpg",
"http://s17.postimg.org/grpsm5awf/cdjs.jpg",
"http://s10.postimg.org/vm3jp80nt/image.jpg",
"http://s14.postimg.org/sdbjkxpk1/party.jpg",
"http://s8.postimg.org/u35cuji1h/soulcycle.jpg",
"http://s12.postimg.org/9qqgbkdy5/tiki.jpg",
"http://s30.postimg.org/3lwjyf2ch/coffee.jpg",
"http://s2.postimg.org/hjsqolel5/nyc.jpg"
]

content = [
	"Looking back, Misty has to be my best investment of 2014.",
	"Amazing view from the Pier, I can't believe this is au naturel.",
	"Never give up on a dream just because of the time it will take to accomplish it. The time will pass anyway.",
	"HELLO SAN FRAN! Finally we meet.",
	"Received a floppy disk invite to a party today, points for innovation, it's been a while since I have seen one of these.",
	"Best way to end the day.",
	"Tiki, the one who ended my disgust for cats. I still have a love-hate relationship with her though.",
	"Thinking back to my vacation in Columbia where I had the best coffee at Mila's, a dreamy patisserie that comes with a nibble of banana bread and a shot of mint-infused water to cleanse your palette with after.",
	"This city never ceases to take my breath away. There will always be a special place in my heart for New York."
	]

tag_name = [
"Music",
"Pets",
"Photography",
"Sports",
"Travel"
]


rebeccaannwong = User.create({
	name: names[0],
	avatar: avatars[0],
	date_joined: date_joined[0],
	location: location[0],
	bio: bio[0]
	})

danielsea = User.create({
	name: names[1],
	avatar: avatars[1],
	date_joined: date_joined[1],
	location: location[1],
	bio: bio[1]
	})

ariellim = User.create({
	name: names[2],
	avatar: avatars[2],
	date_joined: date_joined[2],
	location: location[2],
	bio: bio[2]
	})

maryannesoh = User.create({
	name: names[3],
	avatar: avatars[3],
	date_joined: date_joined[3],
	location: location[3],
	bio: bio[3]
	})

ivansebastiancheng = User.create({
	name: names[4],
	avatar: avatars[4],
	date_joined: date_joined[4],
	location: location[4],
	bio: bio[4]
	})


p1 = Post.create({
	title: title[0],
	image: image[0],
	content: content[0],
	user: rebeccaannwong
})


p2 = Post.create({
	title: title[1],
	image: image[1],
	content: content[1],
	user: rebeccaannwong
})


p3 = Post.create({
	title: title[2],
	image: image[2],
	content: content[2],
	user: danielsea
})


p4 = Post.create({
	title: title[3],
	image: image[3],
	content: content[3],
	user: ariellim
})


p5 = Post.create({
	title: title[4],
	image: image[4],
	content: content[4],
	user: ariellim
})


p6 = Post.create({
	title: title[5],
	image: image[5],
	content: content[5],
	user: maryannesoh
})


p7 = Post.create({
	title: title[6],
	image: image[6],
	content: content[6],
	user: maryannesoh
})


p8 = Post.create({
	title: title[7],
	image: image[7],
	content: content[7],
	user: ivansebastiancheng
})


p9 = Post.create({
	title: title[8],
	image: image[8],
	content: content[8],
	user: ivansebastiancheng
})


t1 = Tag.create({
	name: tag_name[0]
})

t2 = Tag.create({
	name: tag_name[1]
})

t3 = Tag.create({
	name: tag_name[2]
})

t4 = Tag.create({
	name: tag_name[3]
})

t5 = Tag.create({
	name: tag_name[4]
})


t1.posts.push(p3)
t2.posts.push(p1, p7)
t3.posts.push(p2, p4, p5, p9)
t4.posts.push(p6)
t5.posts.push(p4, p8)


