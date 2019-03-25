User.destroy_all
Post.destroy_all
Comment.destroy_all

brit = User.create(name: "Brit")
scott = User.create(name: "Scott")

assoc_good = Post.create(
  user_id: brit.id,
  title: "Associations are cool",
  content: "Associations are a little tricky but seem really powerful.
    I'm excited to build apps with them this week. Cool Cool Cool."
)

omg_im_braindead = Post.create(
  user_id: brit.id,
  title: "Great Programmer, Mediocre Writer",
  content: "I aspire to greatness. To find my home in one sentence,
  concise as if hammered in metal. Not to enchant anyone, not to earn
  a name in posterity. An unnamed need for order, for rhythm, for form,
  which three words are opposed to chaos and nothingness."
)

i_left_the_oven_on = Post.create(
  user_id: scott.id,
  title: "Whoops!",
  content: "This is the greatest lecture I've ever seen and I'm so regretting
  that I had to run out because I left the oven on. Heartbreaking!"
)

disclaimer = Comment.create(
  user_id: brit.id,
  post_id: omg_im_braindead.id,
  content: "Okay, I actually stole the good writing from Czeslaw Milosz."
)

lulz = Comment.create(
  user_id: scott.id,
  post_id: omg_im_braindead.id,
  content: "haha, you had me going, shouldn't have fessed up.
  thought you could write!"
)
