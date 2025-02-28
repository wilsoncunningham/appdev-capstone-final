task(:generate_plan_content => :environment) do
  if Rails.env.development?
    ReadingPlanContent.destroy_all
  end
  bible_books = [
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
  ]

  # preliminary_track_positions = {}


  bible_books.each_with_index do |book_title, idx|
    # preliminary_track_positions[book_title] = idx + 1

    new_plan_content = ReadingPlanContent.new
    new_plan_content.plan_id = ReadingPlan.where({:title => "Preliminary Plan"})[0].id
    new_plan_content.book_id = Book.where({:title => book_title})[0].id
    new_plan_content.sequence = idx + 1

    new_plan_content.save
  end

  
end
