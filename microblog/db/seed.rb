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
	"Bill Gates", 
	"Emma Watson", 
	"Conan O'Brien", 
	"Kanye West", 
	"Taylor Swift", 
	"Michelle Obama", 
	"Anderson Cooper", 
	"Neil Patrick Harris", 
	"Lana Del Rey", 
	"Hugh Jackman", 
	"Pharrell Williams", 
	"Ellen DeGeneres"]

avatars = [
	"https://pbs.twimg.com/profile_images/1884069342/BGtwitter.JPG", 
	"https://pbs.twimg.com/profile_images/514108659660759040/PwcLTe3q.jpeg", 
	"https://pbs.twimg.com/profile_images/728337241/conan_4cred.jpg", 
	"https://pbs.twimg.com/profile_images/1132696610/securedownload.jpeg", 
	"https://pbs.twimg.com/profile_images/505200807503867904/osJXmYRl.jpeg",
	"https://pbs.twimg.com/profile_images/507610912933441538/HCKhYoBO.png",
	"https://pbs.twimg.com/profile_images/344513261579555483/c735576e8913eb6fbf9ec3d35b74dbcc.jpeg",
	"https://pbs.twimg.com/profile_images/378800000601987374/898bea5682c583597c4f471bdbb87a4b.jpeg",
	"https://pbs.twimg.com/profile_images/479308328237940737/MLQ3sFUJ.jpeg",
	"https://pbs.twimg.com/profile_images/124111564/08_Jackman_085.jpg",
	"https://pbs.twimg.com/profile_images/442061377411108864/XfqEYJFc.jpeg",
	"https://pbs.twimg.com/profile_images/506879346162671616/Dubu0oa3.png"
]

date_joined = [
	"January 2013",
	"February 2013",
	"March 2013",
	"April 2013",
	"May 2013",
	"June 2013",
	"July 2013",
	"August 2013",
	"September 2013",
	"October 2013",
	"November 2013",
	"December 2013"
	]

location = [
	"Seattle",
	"London",
	"Los Angeles",
	"Washington DC",
	"New York",
	"Sydney"
	]

bio = [
	"Sharing things I'm learning through my foundation work and other interests",
	"British actress, Goodwill Ambassador for UN Women",
	"The voice of the people. Sorry, people.",
	"Yeezus",
	"Born in 1989",
	"From the First Lady",
	"Anchor of AC360",
	"I act some. Dig variety acts, Pixar, puppets, theme parks and great meals.",
	"The roses had the look of flowers that are looked at.",
	"Australian actor, producer, and singer",
	"Happy",
	"Comedian, talk show host and ice road trucker."
]

title = [
	"We Can Eradicate Malaria—Within a Generation",
	"He For She",
	"Pumpkin Spice",
	"Still No Hard Bottom",
	"Spotify",
	"Talking to Our Kids about Newtown",
	"Fear",
	"Being Awesome",
	"Untitled",
	"Wolverine",
	"I am Other",
	"Procrastination"
]

content = [
	"Based on the progress I’m seeing in the lab and on the ground, I believe we’re now in a position to eradicate malaria—that is, wipe it out completely in every country—within a generation. This is one of the greatest opportunities the global health world has ever had. Melinda and I are so optimistic about it that we recently decided to increase our foundation’s malaria budget by 30 percent.",
	"I am from Britain and think it is right that as a woman I am paid the same as my male counterparts. I think it is right that I should be able to make decisions about my own body. I think it is right that women be involved on my behalf in the policies and decision-making of my country. I think it is right that socially I am afforded the same respect as men.",
	"I asked nicely, but the DMV won’t change the hair color on my driver’s license to pumpkin spice.",
	"We in Japan... just came from the Isetan store ... Raf Simons is crazy this season... Comme des Garcons went crazy also, they've got this over the top Pink corduroy blazer but I ain't finna show it till I wear it... Dries kinda let me down last season (the stuff in the store now) but I saw a couple of really dope pieces today on the runway",
	"If I had streamed the new album, it’s impossible to try to speculate what would have happened. But all I can say is that music is changing so quickly, and the landscape of the music industry itself is changing so quickly, that everything new, like Spotify, all feels to me a bit like a grand experiment. And I’m not willing to contribute my life’s work to an experiment that I don’t feel fairly compensates the writers, producers, artists, and creators of this music.",
	"We can tell our kids that we’re doing everything we can to keep them safe and make sure they feel loved – and so are their teachers, coaches, faith leaders, Scout leaders and everyone else who plays a role in their lives. We can remind them to be grateful for the educators who work every day to help them achieve their dreams – and for the first responders who risk their lives at a moment’s notice to protect ours. We can tell them about the extraordinary people of Newtown and how they have responded to unspeakable tragedy: the educators who sprang into action; the children who carefully followed instructions and comforted each other amidst the chaos; the neighbors and faith leaders who have come together to support one another. And finally, we can tell them that it’s our job now to stand with the people of Newtown – to pray for them and to find ways, large and small, to show them that they are not alone in their grief.",
	"I don't like anything that scares me, and I prefer to face it head on and get over it. Anyone who says they're not scared is a fool, a liar or both. I just don't want that fear in my stomach to be part of my life, so I work to eliminate it.",
	"When I'm sad, I stop being sad, and be awesome instead.",
	"I was always an unusual girl, my mother told me that I had a chameleon soul. No moral compass pointing me due north, no fixed personality. Just an inner indecisiveness that was as wide as wavering as the ocean. And if I said that I didn't plan for it to turn out this way I’d be lying- because I was born to be the other woman. I belonged to no one- who belonged to everyone, who had nothing- who wanted everything with a fire for every experience and an obsession for freedom that terrified me to the point that I couldn’t even talk about- and pushed me to a nomadic point of madness that both dazzled and dizzied me. Every night I used to pray that I’d find my people- and finally I did- on the open road. We have nothing to lose, nothing to gain, nothing we desired anymore- except to make our lives into a work of art.",
	"Nine out of 10 characteristics of Wolverine I don't share, but aggression is a primal thing and needs to be exercised in some way. When I was younger I was very explosive. I used to let most of it out playing rugby. I'm not as explosive now but in a sense it's still there. It's in our DNA ... far better to have it in a controlled violent environment. So in a way playing Wolverine is good therapy.",
	"I'm just very thankful. And I say that alot because it is very important.",
	"Procrastination is not the problem. It is the solution. It is the universe's way of saying stop, slow down, you move too fast. Listen to the music. Whoa whoa, listen to the music. Because music makes the people come together, it makes the bourgeois and the rebel. So come on people now, smile on your brother, everybody try to love one another. Because what the world needs now is love, sweet love. And I know that love is a battlefield, but boogie on reggae woman because you're gonna make it after all. So celebrate good times, come on. I've gotta stop I've gotta come to my senses, I've been out riding fences for so long... oops I did it again... um... What I'm trying to say is, if you leave tonight and you don't remember anything else that I've said, leave here and remember this: Procrastinate now, don't put it off."
]

tag_name = [
"Society",
"Food",
"Fashion",
"Music",
"World Issues",
"Opinion",
"Personal",
"Movies",
"Art",
"News",
"Travel",
"Entertainment",
"Tech",
"Sports",
"Health"]


billgates = User.create({
	name: names[0],
	avatar: avatars[0],
	date_joined: date_joined[0],
	location: location[0],
	bio: bio[0]
	})

emmawatson = User.create({
	name: names[1],
	avatar: avatars[1],
	date_joined: date_joined[1],
	location: location[1],
	bio: bio[1]
	})

conanobrien = User.create({
	name: names[2],
	avatar: avatars[2],
	date_joined: date_joined[2],
	location: location[2],
	bio: bio[2]
	})

kanyewest = User.create({
	name: names[3],
	avatar: avatars[3],
	date_joined: date_joined[3],
	location: location[2],
	bio: bio[3]
	})

taylorswift = User.create({
	name: names[4],
	avatar: avatars[4],
	date_joined: date_joined[4],
	location: location[4],
	bio: bio[4]
	})

michelleobama = User.create({
	name: names[5],
	avatar: avatars[5],
	date_joined: date_joined[5],
	location: location[3],
	bio: bio[5]
	})

andersoncooper = User.create({
	name: names[6],
	avatar: avatars[6],
	date_joined: date_joined[6],
	location: location[4],
	bio: bio[6]
	})

neilpatrickharris = User.create({
	name: names[7],
	avatar: avatars[7],
	date_joined: date_joined[7],
	location: location[4],
	bio: bio[7]
	})

lanadelrey = User.create({
	name: names[8],
	avatar: avatars[8],
	date_joined: date_joined[8],
	location: location[4],
	bio: bio[8]
	})

hughjackman = User.create({
	name: names[9],
	avatar: avatars[9],
	date_joined: date_joined[9],
	location: location[5],
	bio: bio[9]
	})

pharrellwilliams = User.create({
	name: names[10],
	avatar: avatars[10],
	date_joined: date_joined[10],
	location: location[4],
	bio: bio[10]
	})

ellendegeneres = User.create({
	name: names[11],
	avatar: avatars[11],
	date_joined: date_joined[11],
	location: location[2],
	bio: bio[11]
	})


p1 = Post.create({
	title: title[0],
	content: content[0],
	user: billgates
})


p2 = Post.create({
	title: title[1],
	content: content[1],
	user: emmawatson
})


p3 = Post.create({
	title: title[2],
	content: content[2],
	user: conanobrien
})


p4 = Post.create({
	title: title[3],
	content: content[3],
	user: kanyewest
})


p5 = Post.create({
	title: title[4],
	content: content[4],
	user: taylorswift
})


p6 = Post.create({
	title: title[5],
	content: content[5],
	user: michelleobama
})


p7 = Post.create({
	title: title[6],
	content: content[6],
	user: andersoncooper
})


p8 = Post.create({
	title: title[7],
	content: content[7],
	user: neilpatrickharris
})


p9 = Post.create({
	title: title[8],
	content: content[8],
	user: lanadelrey
})


p10 = Post.create({
	title: title[9],
	content: content[9],
	user: hughjackman
})


p11 = Post.create({
	title: title[10],
	content: content[10],
	user: pharrellwilliams
})


p12 = Post.create({
	title: title[11],
	content: content[11],
	user: ellendegeneres
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

t6 = Tag.create({
	name: tag_name[5]
})

t7 = Tag.create({
	name: tag_name[6]
})

t8 = Tag.create({
	name: tag_name[7]
})

t9 = Tag.create({
	name: tag_name[8]
})

t10 = Tag.create({
	name: tag_name[9]
})

t11 = Tag.create({
	name: tag_name[10]
})

t12 = Tag.create({
	name: tag_name[11]
})

t13 = Tag.create({
	name: tag_name[12]
})

t14 = Tag.create({
	name: tag_name[13]
})

t15 = Tag.create({
	name: tag_name[14]
})


t1.posts.push(p1, p2, p6)
t2.posts.push(p3)
t3.posts.push(p4)
t4.posts.push(p5, p9, p11)
t5.posts.push(p1, p2, p6)
t6.posts.push(p3, p4, p7, p8, p10, p11, p12)
t7.posts.push(p7, p8, p9, p11)
t8.posts.push(p10)
t9.posts.push(p5)
t10.posts.push(p1, p2, p6)
t11.posts.push(p4)
t12.posts.push(p10)
t13.posts.push(p5)
t14.posts.push(p9)
t15.posts.push(p1)

