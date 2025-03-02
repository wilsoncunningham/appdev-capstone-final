task(:generate_reading_plan => :environment) do
  if Rails.env.development?
    ReadingPlan.destroy_all
  end

  plan = ReadingPlan.new
  plan.title = "Cover to Cover (Chronological)"
  plan.description = "Want to read the entire Bible cover to cover? This plan will take you through each book in chronological order.
                      Starting at Genesis and ending at Revelation, this is a long plan, but an amazing goal for anyone!"
  plan.save

  plan = ReadingPlan.new
  plan.title = "My Way"
  plan.description = "And now, the end is near
                      And so I face the final curtain
                      My friend, I'll say it clear
                      I'll state my case, of which I'm certain
                      I've lived a life that's full
                      I traveled each and every highway
                      And more, much more than this
                      I did it my way
                      Regrets, I've had a few
                      But then again, too few to mention
                      I did what I had to do
                      And saw it through without exemption
                      I planned each charted course
                      Each careful step along the byway
                      And more, much more than this
                      I did it my way
                      Yes, there were times, I'm sure you knew
                      When I bit off more than I could chew
                      But through it all, when there was doubt
                      I ate it up and spit it out
                      I faced it all, and I stood tall
                      And did it my way
                      I've loved, I've laughed and cried
                      I've had my fill, my share of losing
                      And now, as tears subside
                      I find it all so amusing
                      To think I did all that
                      And may I say, not in a shy way
                      Oh, no, oh, no, not me
                      I did it my way
                      For what is a man, what has he got?
                      If not himself, then he has naught
                      To say the things he truly feels
                      And not the words of one who kneels
                      The record shows I took the blows
                      And did it my way
                      Yes, it was my way"
  plan.save

  plan = ReadingPlan.new
  plan.title = "Amazing Grace"
  plan.description = "Amazing grace, how sweet the sound
                      That saved a wretch like me
                      I once was lost, but now I'm found
                      Was blind, but now I see
                      'Twas grace that taught my heart to fear
                      And grace my fears relieved
                      How precious did that grace appear
                      The hour I first believed
                      Through many dangers, toils, and snares
                      We have already come
                      'Twas grace that brought us safe thus far
                      And grace will lead us home
                      When we've been there ten thousand years
                      Bright shining as the sun
                      We've no less days to sing God's praise
                      Than when we've first begun
                      Than when we've first begun"
  plan.save

  plan = ReadingPlan.new
  plan.title = "Gospels: The Life of Jesus"
  plan.description = "Read through each of the four Gospels and take a deep dive into the life and teachings of Jesus.
                      Each of the four Gospels--Matthew, Mark, Luke, and John--has its own unique literary qualitites.
                      By reading each of these, you can come to better know who Jesus truly is and understand his ministry,
                       death, and resurrection."
  plan.save


  plan = ReadingPlan.new
  plan.title = "The Arc of Salvation"
  plan.description = ""
  plan.save


  plan = ReadingPlan.new
  plan.title = "Knowing the Epistles"
  plan.description = ""
  plan.save


  plan = ReadingPlan.new
  plan.title = "Prayer, Poetry, and Pensiveness"
  plan.description = ""
  plan.save


end
