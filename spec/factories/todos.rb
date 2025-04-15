FactoryBot.define do
  factory :todo do
    title { 'John Doe' }
    description do
      'This is a description'
    end

    completed { false }
  end
end