[User, Comment, Tag, Idea].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

tags = Tag.create!([{
                     name: 'HR'
                   }, {
                     name: 'Ops'
                   }, {
                     name: 'Finance'
                   }, {
                     name: 'Strategy'
                   }, {
                     name: 'Compliance'
                   }, {
                     name: 'Marketing'
                   }, {
                     name: 'Research'
                   }, {
                     name: 'Logistics'
                   }, {
                     name: 'Process'
                   }, {
                     name: 'Product'
                   }])

users = User.create!([
                       { username: 'mickyginger', first_name: 'Mike', last_name: 'Hayden', email: 'mickyginger@ga.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://avatars2.githubusercontent.com/u/3531085?v=4&s=460'},
                       { username: 'eisacke', first_name: 'Emily', last_name: 'Isacke', email: 'isake@ga.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://avatars2.githubusercontent.com/u/12997768?v=4&s=460'},
                       { username: 'markyjangles', first_name: 'Marc', last_name: 'De Vois', email: 'devois@ga.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://avatars0.githubusercontent.com/u/428493?v=4&s=460'},
                       { username: 'max', first_name: 'Max', last_name: 'Eskell', email: 'max@ga.com', password: 'password', password_confirmation: 'password', remote_image_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAyAAAAAJDZmMmFlNmM4LTlhZjAtNDY0ZC1iNTkyLWI4YTdmYjcyZmIzMQ.jpg" }
                     ])

ideas = Idea.create!([
                       { title: 'new code language', pitch: "let's create a new code which does everything and is great", description: 'We will create a new langaue that will rule the world!!!', remote_image_url: 'https://tctechcrunch2011.files.wordpress.com/2015/04/codecode.jpg?w=738', campaign_duration: '80', who_we_need: 'two developers, two designers', benefits_for_you: 'happiness', user: users[0], tags: tags[1,2], target: 4},
                       { title: 'otters 4 everyone', pitch: 'lets make the world a better place with otters', description: 'Issue everyone with 1 x otters and supporting equipment', remote_image_url: 'https://images7.alphacoders.com/355/thumb-1920-355113.jpg', campaign_duration: '90', who_we_need: '7.2 billion otters', benefits_for_you: 'otteryness', user: users[1], tags: tags[2,3], target: 5 },
                       { title: 'green travel', pitch: "let's reduce our carbon footprint by 50%", description: 'We are the thrid highest user of airtravel in the world.  A 50% reduction would save thousands of tones of CO2', remote_image_url: 'https://d3gxp3iknbs7bs.cloudfront.net/media/618/364a3506-8edc-427d-92be-2667e6c872a1.jpg', campaign_duration: '20', who_we_need: 'three people to help brainstrom and get stuff done', benefits_for_you: 'a chance to be involved in a great project for the firm and the environment', user: users[1], tags: tags[1,5], target: 3 },
                       { title: 'AI for hiring', pitch: 'lets create a new code which does everything and is great', description: 'We will create a new langaue that will rule the world!!!', remote_image_url: 'http://www.impactlab.net/wp-content/uploads/2016/02/ai-image.jpg', campaign_duration: '80', who_we_need: 'two developers, two designers', benefits_for_you: 'happiness', user: users[2], tags: tags[3,4], target: 7 }
                     ])

comments = Comment.create!([{
                             body: 'I think this is a great idea.  It could be improved with x, y, z', user: users[0], idea: ideas[3]
                           }, {
                             body: 'I would love to try this out.  Email so we can set this up!', user: users[1], idea: ideas[2]
                           }, {
                             body: 'You really need to think about integrating cowbells into this', user: users[2], idea: ideas[1]
                           }, {
                             body: 'I think using bottle necks is not a great idea, and may cause a bottle neck', user: users[3], idea: ideas[0]
                           }])



ideas[0].loves << users[2]
ideas[0].loves << users[3]
ideas[0].loves << users[1]
ideas[1].loves << users[2]
ideas[2].loves << users[0]
ideas[2].loves << users[3]
ideas[3].loves << users[0]
ideas[3].loves << users[1]

ideas[0].joiners << users[0]
ideas[0].joiners << users[1]
ideas[1].joiners << users[1]
ideas[1].joiners << users[2]
ideas[2].joiners << users[2]
ideas[2].joiners << users[3]
ideas[3].joiners << users[2]
ideas[3].joiners << users[3]
