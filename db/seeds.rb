# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(
  name: 'Hironao Uehara',
  email: 'ueueue6217@gmail.com',
  password: 'password'
)

50.times do |n|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               department: "QA Dept.")
end

#   20.times do |t|
#   title  = "TEST-#{t+1}"
#   description = "This is test category."
#   Category.create!(title:  title,
#                description: description
#                )
# end

categories = [
{
      title: "Basic noun 10: French", 
      description: "This is test category. 10 basic words are registered in this category. Please try this at first.",
      difficulty: "0"
},
{
      title: "Basic noun 10: Japanese", 
      description: "This is test category. 10 basic words are registered in this category. Please try this at first.",
      difficulty: "0"
},
{
      title: "Advanced noun 30", 
      description: "This is test category. 30 words advanced words are registered in this category. Please try this after the bacical categories.",
      difficulty: "0"
},
{
      title: "Advanced verb 60", 
      description: "This is test category. 60 words advanced words are registered in this category. Please try this after the bacical categories.",
      difficulty: "0"
}
]


categories.each do |category_params|
      Category.create(category_params)
end


words = [
      {      
      content: "Printemps", 
      choices_attributes:
            [
            {
                  content: "Spring", 
                  judge:"1",
            },
            {
                  content: "Summer", 
            },
            {
                  content: "Autumn", 
            },
            {
                  content: "Winter", 
            }
            ]
      },
      {
            content: "Ciel", 
            choices_attributes:
            [
            {
                  content: "Star", 
            },
            {
                  content: "Sky", 
                  judge:"1",
            },
            {
                  content: "Rainbow", 
            },
            {
                  content: "Night", 
            }
            ]
      },
      {
            content: "Vous", 
            choices_attributes:
            [
            {
                  content: "Me", 
            },
            {
                  content: "She", 
            },
            {
                  content: "You", 
                  judge:"1",
            },
            {
                  content: "They", 
            }
            ]
      },
      {
            content: "Avenir", 
            choices_attributes:
            [
            {
                  content: "Future", 
                  judge:"1", 
            },
            {
                  content: "Past", 
            },
            {
                  content: "Time",
            },
            {
                  content: "Hour",
            }
            ]
      },
      {
            content: "Lune", 
            choices_attributes:
            [
            {
                  content: "Sun", 
            },
            {
                  content: "Planet", 
            },
            {
                  content: "Star", 
            },
            {
                  content: "Moon", 
                  judge:"1",
            }
            ]
      },
      {
            content: "Étoile", 
            choices_attributes:
            [
            {
                  content: "Star", 
                  judge:"1",
            },
            {
                  content: "Silius", 
            },
            {
                  content: "Stage", 
            },
            {
                  content: "Strange",
            }
            ]
      },
      {
            content: "Bisou", 
            choices_attributes:
            [
            {
                  content: "Reality", 
            },
            {
                  content: "Jewel", 
                  judge:"1",
            },
            {
                  content: "Home", 
            },
            {
                  content: "Canpany", 
            }
            ]
      },
      {
            content: "Espoir", 
            choices_attributes:
            [
            {
                  content: "Sadness", 
            },
            {
                  content: "Happiness", 
            },
            {
                  content: "Hope", 
                  judge:"1",
            },
            {
                  content: "Joy", 
            }
            ]
      },
      {
            content: "Famille", 
            choices_attributes:
            [
            {
                  content: "Farm", 
            },
            {
                  content: "Form", 
            },
            {
                  content: "Fantasy", 
            },
            {
                  content: "Family", 
                  judge:"1",
            }
            ]
      },
      {
            content: "Vérité", 
            choices_attributes:
            [
            {
                  content: "True", 
                  judge:"1",
            },
            {
                  content: "False", 
            },
            {
                  content: "Good", 
            },
            {
                  content: "Bad", 
            }
            ]
      }
]



category = Category.first

words.each do |word_params|
      category.words.create!(word_params)
end

words = [
      {      
      content: "朝", 
      choices_attributes:
            [
            {
                  content: "Noon", 
            },
            {
                  content: "Morning", 
                  judge:"1",
            },
            {
                  content: "Evening", 
            },
            {
                  content: "Night", 
            }
            ]
      },
      {
            content: "水", 
            choices_attributes:
            [
            {
                  content: "Water", 
                  judge:"1",
            },
            {
                  content: "Sky", 
            },
            {
                  content: "Ripple", 
            },
            {
                  content: "Night", 
            }
            ]
      },
      {
            content: "夢", 
            choices_attributes:
            [
            {
                  content: "Future", 
            },
            {
                  content: "Night", 
            },
            {
                  content: "Dream", 
                  judge:"1",
            },
            {
                  content: "White", 
            }
            ]
      },
      {
            content: "過去", 
            choices_attributes:
            [
            {
                  content: "Future", 
            },
            {
                  content: "Past", 
                  judge:"1", 
            },
            {
                  content: "Time",
            },
            {
                  content: "Hour",
            }
            ]
      },
      {
            content: "太陽", 
            choices_attributes:
            [
            {
                  content: "Sun", 
                  judge:"1",
            },
            {
                  content: "Planet", 
            },
            {
                  content: "Star", 
            },
            {
                  content: "Moon", 
            }
            ]
      },
      {
            content: "変人", 
            choices_attributes:
            [
            {
                  content: "Star", 
            },
            {
                  content: "Silius", 
            },
            {
                  content: "Stage", 
            },
            {
                  content: "Stranger",
                  judge:"1",
            }
            ]
      },
      {
            content: "現実", 
            choices_attributes:
            [
            {
                  content: "Reality", 
                  judge:"1",
            },
            {
                  content: "Jewel", 
            },
            {
                  content: "Home", 
            },
            {
                  content: "Canpany", 
            }
            ]
      },
      {
            content: "喜び", 
            choices_attributes:
            [
            {
                  content: "Sadness", 
            },
            {
                  content: "Happiness", 
            },
            {
                  content: "Hope", 
            },
            {
                  content: "Joy", 
                  judge:"1",
            }
            ]
      },
      {
            content: "幻想", 
            choices_attributes:
            [
            {
                  content: "Farm", 
            },
            {
                  content: "Form", 
            },
            {
                  content: "Fantasy", 
                  judge:"1",
            },
            {
                  content: "Family", 
            }
            ]
      },
      {
            content: "嘘", 
            choices_attributes:
            [
            {
                  content: "True", 
            },
            {
                  content: "False", 
            },
            {
                  content: "Lie",
                  judge:"1", 
            },
            {
                  content: "Honesty", 
            }
            ]
}
]