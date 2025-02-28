task(:generate_books => :environment) do
  if Rails.env.development?
    Book.destroy_all
  end

  bible_books = {
  "Genesis" => 50, "Exodus" => 40, "Leviticus" => 27, "Numbers" => 36, "Deuteronomy" => 34,
  "Joshua" => 24, "Judges" => 21, "Ruth" => 4, "1 Samuel" => 31, "2 Samuel" => 24,
  "1 Kings" => 22, "2 Kings" => 25, "1 Chronicles" => 29, "2 Chronicles" => 36, "Ezra" => 10,
  "Nehemiah" => 13, "Esther" => 10, "Job" => 42, "Psalms" => 150, "Proverbs" => 31,
  "Ecclesiastes" => 12, "Song of Solomon" => 8, "Isaiah" => 66, "Jeremiah" => 52, "Lamentations" => 5,
  "Ezekiel" => 48, "Daniel" => 12, "Hosea" => 14, "Joel" => 3, "Amos" => 9,
  "Obadiah" => 1, "Jonah" => 4, "Micah" => 7, "Nahum" => 3, "Habakkuk" => 3,
  "Zephaniah" => 3, "Haggai" => 2, "Zechariah" => 14, "Malachi" => 4,
  "Matthew" => 28, "Mark" => 16, "Luke" => 24, "John" => 21, "Acts" => 28,
  "Romans" => 16, "1 Corinthians" => 16, "2 Corinthians" => 13, "Galatians" => 6, "Ephesians" => 6,
  "Philippians" => 4, "Colossians" => 4, "1 Thessalonians" => 5, "2 Thessalonians" => 3, "1 Timothy" => 6,
  "2 Timothy" => 4, "Titus" => 3, "Philemon" => 1, "Hebrews" => 13, "James" => 5,
  "1 Peter" => 5, "2 Peter" => 3, "1 John" => 5, "2 John" => 1, "3 John" => 1,
  "Jude" => 1, "Revelation" => 22
  }

  bible_books.each do |book_title, num_chapters|
    bk = Book.new
  
    bk.title = book_title
    bk.total_chapters = num_chapters

    bk.save
  end


  ot_books_list = [
      "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy",
      "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel",
      "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra",
      "Nehemiah", "Esther", "Job", "Psalms", "Proverbs",
      "Ecclesiastes", "Song of Solomon", "Isaiah", "Jeremiah", "Lamentations",
      "Ezekiel", "Daniel", "Hosea", "Joel", "Amos",
      "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk",
      "Zephaniah", "Haggai", "Zechariah", "Malachi"
    ]

  nt_books_list = [
    "Matthew", "Mark", "Luke", "John", "Acts",
    "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians",
    "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy",
    "2 Timothy", "Titus", "Philemon", "Hebrews", "James",
    "1 Peter", "2 Peter", "1 John", "2 John", "3 John",
    "Jude", "Revelation"
  ]

  ot_books_list.each_with_index do |book_title, idx|
    bk = Book.where({:title => book_title})[0]

    bk.testament = "old"
    bk.bible_position = idx + 1

    bk.save
  end

  nt_books_list.each_with_index do |book_title, idx|
    bk = Book.where({:title => book_title})[0]

    bk.testament = "new"
    bk.bible_position = idx + 40

    bk.save
  end

end
