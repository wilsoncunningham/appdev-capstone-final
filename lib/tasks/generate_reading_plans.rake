task(:generate_reading_plans => :environment) do
  if Rails.env.development?
    ReadingPlan.destroy_all
  end

  plans = {
    "Cover to Cover (Chronological)" => 
      "Want to experience the Bible as a complete, unfolding story? This plan takes you through the entire Bible in chronological order, following the historical sequence of events. From Genesis to Revelation, you’ll gain a deeper understanding of God’s redemptive plan through history. A long but deeply rewarding journey!",
    "Gospels: The Life of Jesus" =>
      "Immerse yourself in the life and teachings of Jesus by reading all four Gospels—Matthew, Mark, Luke, and John—in order. Each Gospel offers a unique perspective on Christ’s ministry, miracles, death, and resurrection. By studying them together, you’ll develop a richer, more complete understanding of who Jesus is and the impact of His message.",
    "The Arc of Salvation: From Fall to Redemption" =>
      "Follow the grand narrative of salvation, from humanity’s fall in the Garden of Eden to the fulfillment of God’s redemptive plan through Jesus Christ. This plan traces key moments in biblical history, including God's covenant with Abraham, the prophecies of a coming Savior, Jesus’ life, death, and resurrection, and New Testament writings that explain the meaning of salvation. Through this journey, you’ll gain a deeper understanding of God’s grace and the hope of redemption.",
    "Acts & The Epistles: The Early Church & Its Teachings" =>
      "Explore the foundational writings of the early church by reading through the Book of Acts, followed by each of the Epistles. Acts provides historical context for the spread of the Gospel and the apostles' ministry, while the Epistles—letters written by Paul, Peter, James, John, and others—offer rich theological insights and practical guidance for believers. This plan will help you understand how the early church grew and how its teachings continue to shape our faith today.",
    "Prayer, Poetry, and Pensiveness" =>
      "Reflect on the deepest questions of life, wisdom, and worship with this curated reading plan. Journey through poetic and contemplative books like Psalms, Proverbs, Ecclesiastes, and Job—along with other prayerful books. These books offer heartfelt prayers, timeless wisdom, and raw human emotion, helping you grow in faith, humility, and devotion."
  }

  plans.each do |title, description|
    new_plan = ReadingPlan.new
    new_plan.title = title
    new_plan.description = description
    new_plan.save
  end



  # plan = ReadingPlan.new
  # plan.title = "Cover to Cover (Chronological)"
  # plan.description = "Want to experience the Bible as a complete, unfolding story? This plan takes you through the entire Bible in chronological order, following the historical sequence of events. From Genesis to Revelation, you’ll gain a deeper understanding of God’s redemptive plan through history. A long but deeply rewarding journey!"
  # plan.save

  # plan = ReadingPlan.new
  # plan.title = "Gospels: The Life of Jesus"
  # plan.description = "Immerse yourself in the life and teachings of Jesus by reading all four Gospels—Matthew, Mark, Luke, and John—in order. Each Gospel offers a unique perspective on Christ’s ministry, miracles, death, and resurrection. By studying them together, you’ll develop a richer, more complete understanding of who Jesus is and the impact of His message."
  # plan.save


  # plan = ReadingPlan.new
  # plan.title = "The Arc of Salvation: From Fall to Redemption"
  # plan.description = "Follow the grand narrative of salvation, from humanity’s fall in the Garden of Eden to the fulfillment of God’s redemptive plan through Jesus Christ. This plan traces key moments in biblical history, including God's covenant with Abraham, the prophecies of a coming Savior, Jesus’ life, death, and resurrection, and New Testament writings that explain the meaning of salvation. Through this journey, you’ll gain a deeper understanding of God’s grace and the hope of redemption."
  # plan.save


  # plan = ReadingPlan.new
  # plan.title = "Acts & The Epistles: The Early Church & Its Teachings"
  # plan.description = "Explore the foundational writings of the early church by reading through the Book of Acts, followed by each of the Epistles. Acts provides historical context for the spread of the Gospel and the apostles' ministry, while the Epistles—letters written by Paul, Peter, James, John, and others—offer rich theological insights and practical guidance for believers. This plan will help you understand how the early church grew and how its teachings continue to shape our faith today."
  # plan.save


  # plan = ReadingPlan.new
  # plan.title = "Prayer, Poetry, and Pensiveness"
  # plan.description = "Reflect on the deepest questions of life, wisdom, and worship with this curated reading plan. Journey through poetic and contemplative books like Psalms, Proverbs, Ecclesiastes, and Job—along with other prayerful books. These books offer heartfelt prayers, timeless wisdom, and raw human emotion, helping you grow in faith, humility, and devotion."
  # plan.save


end
