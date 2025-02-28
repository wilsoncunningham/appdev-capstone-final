task(:generate_chapters => :environment) do
  if Rails.env.development?
    Chapter.destroy_all
  end

  Book.all.each do |book|
    book.total_chapters.times do |chapter_number|
      chap = Chapter.new

      chap.book_id = book.id
      chap.number = chapter_number + 1

      api_params_q = "#{book.title} #{chapter_number + 1}"

      chap.content = api_params_q

      chap.save
    end
  end

end
