[User, Comment, Tag].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

users = User.create!([
  { username: "mickyginger", first_name: "Mike", last_name: "Hayden", email: "mickyginger@ga.com"},
  { username: "eisacke", first_name: "Emily", last_name: "Isacke", email: "isake@ga.com"},
  { username: "markyjangles", first_name: "Marc", last_name: "De Vois", email: "devois@ga.com" }
])

ideas = Idea.create!([
  { title: "new code language", pitch: "lets create a new code which does everything and is great", description: "We will create a new langaue that will rule the world!!!", image: "image is here", campaign_duration: "80", who_we_need: "two developers, two designers", benefits_for_you: "happiness", user: users[0]},
  { title: "otters 4 everyone", pitch: "lets make the world a better place with otters", description: "Issue everyone with 1 x otters and supporting equipment", image: "image is here", campaign_duration: "90", who_we_need: "7.2 billion otters", benefits_for_you: "otteryness", user: users[1]},
    { title: "AI for hiring", pitch: "lets create a new code which does everything and is great", description: "We will create a new langaue that will rule the world!!!", image: "image is here", campaign_duration: "80", who_we_need: "two developers, two designers", benefits_for_you: "happiness", user: users[2]
      }])

comments = Comment.create!([{
  subject: "Quick thought!", body: "I think this is a great idea.  It could be improved with x, y, z", user: users[0], idea: ideas[2]
  }, {
  subject: "How about cow bells?", body: "You really need to think about integrating cowbells into this", user: users[1], idea: ideas[2]
  }, {
  subject: "Possible bottle neck", body: "I think using bottle necks is not a great idea, and may cause a bottle neck", user: users[1], idea: ideas[0]
  }])

ideas[0].loves << users[2]
ideas[1].loves << users[1]
ideas[2].loves << users[0]
