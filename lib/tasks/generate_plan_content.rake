task(:generate_plan_content => :environment) do
  if Rails.env.development?
    ReadingPlanContent.destroy_all
  end

  plans = ReadingPlan.all

  sequences = {"Cover to Cover (Chronological)" => 
                    [
                      "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy",
                      "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel",
                      "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra",
                      "Nehemiah", "Esther", "Job", "Psalms", "Proverbs",
                      "Ecclesiastes", "Song of Solomon", "Isaiah", "Jeremiah", "Lamentations",
                      "Ezekiel", "Daniel", "Hosea", "Joel", "Amos", "Obadiah", "Jonah",
                      "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah",
                      "Malachi", "Matthew", "Mark", "Luke", "John", "Acts",
                      "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians",
                      "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy",
                      "2 Timothy", "Titus", "Philemon", "Hebrews", "James",
                      "1 Peter", "2 Peter", "1 John", "2 John", "3 John",
                    "Jude", "Revelation"
                    ],
                "Gospels: The Life of Jesus" =>
                    ["Matthew", "Mark", "Luke", "John"],
                "Acts & The Epistles: The Early Church & Its Teachings" =>
                    [
                      "Acts",
                      "James",
                      "Galatians",
                      "1 Thessalonians",
                      "2 Thessalonians",
                      "1 Corinthians",
                      "2 Corinthians",
                      "Romans",
                      "Ephesians",
                      "Philippians",
                      "Colossians",
                      "Philemon",
                      "Hebrews",
                      "1 Timothy",
                      "Titus",
                      "2 Timothy",
                      "1 Peter",
                      "2 Peter",
                      "Jude",
                      "1 John",
                      "2 John",
                      "3 John",
                      "Revelation"
                    ],
                "Prayer, Poetry, and Pensiveness" =>
                    ["Job", "Psalms", "Proverbs", "Ecclesiastes", "Song of Solomon", "Jonah"],
                "The Arc of Salvation: From Fall to Redemption" =>
                    [
                      "Genesis",
                      "Exodus",
                      "2 Samuel",
                      "Isaiah",
                      "Jeremiah",
                      "Ezekiel",
                      "Luke",
                      "Matthew",
                      "John",
                      "Acts",
                      "Romans",
                      "Galatians",
                      "Ephesians",
                      "Hebrews",
                      "Revelation"
                    ]
  }

  plans.each do |plan|
    corresponding_seq = sequences.fetch(plan.title)
    corresponding_seq.each_with_index do |book_title, idx|
      new_plan_content = ReadingPlanContent.new
      new_plan_content.plan_id = plan.id
      new_plan_content.book_id = Book.where({:title => book_title})[0].id
      new_plan_content.sequence = idx + 1

      new_plan_content.save
    end
  end

    
end
