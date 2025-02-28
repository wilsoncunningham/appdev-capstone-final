task(:generate_reading_plan => :environment) do
  if Rails.env.development?
    ReadingPlan.destroy_all
  end

  plan = ReadingPlan.new
  plan.title = "Preliminary Plan"
  plan.description = "I am testing out how to make a reading plan."
  plan.save

end
