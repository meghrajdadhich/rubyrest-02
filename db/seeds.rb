50.times do
  Question.create({
      pri: Faker::Number.unique.number(2),
      quiz: Faker::Lorem.sentence,
      teamingStages: Faker::Name.first_name,
      appearsDay: Faker::Number.number(2),
      frequency: Faker::Number.number(2),
      qType: Faker::Name.first_name,
      role: Faker::Name.first_name,
      required: Faker::Name.first_name,
      conditions: Faker::Name.first_name,
      mapping: Faker::Name.last_name
  })
end
