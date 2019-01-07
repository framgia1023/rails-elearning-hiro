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
  password: 'password',
  admin: true;
)

50.times do |n|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end



categories = [
{
      title: "Basic noun 10: French", 
      description: "This is test category. 10 basic words are registered in this category. Please try this at first.",
},
{
      title: "Basic noun 10: Japanese", 
      description: "This is test category. 10 basic words are registered in this category. Please try this at first.",
},
{
      title: "Advanced noun 30", 
      description: "This is test category. 30 words advanced words are registered in this category. Please try this after the bacical categories.",
},
{
      title: "Advanced verb 60", 
      description: "This is test category. 60 words advanced words are registered in this category. Please try this after the bacical categories.",
}
]


categories.each do |category_params|
      Category.create(category_params)
end


words = [
      {      
      word: "Printemps", 
      choices_attributes:
            [
            {
                  choice: "Spring", 
                  correct:"1",
            },
            {
                  choice: "Summer", 
            },
            {
                  choice: "Autumn", 
            },
            {
                  choice: "Winter", 
            }
            ]
      },
      {
            word: "Ciel", 
            choices_attributes:
            [
            {
                  choice: "Star", 
            },
            {
                  choice: "Sky", 
                  correct:"1",
            },
            {
                  choice: "Rainbow", 
            },
            {
                  choice: "Night", 
            }
            ]
      },
      {
            word: "Vous", 
            choices_attributes:
            [
            {
                  choice: "Me", 
            },
            {
                  choice: "She", 
            },
            {
                  choice: "You", 
                  correct:"1",
            },
            {
                  choice: "They", 
            }
            ]
      },
      {
            word: "Avenir", 
            choices_attributes:
            [
            {
                  choice: "Future", 
                  correct:"1", 
            },
            {
                  choice: "Past", 
            },
            {
                  choice: "Time",
            },
            {
                  choice: "Hour",
            }
            ]
      },
      {
            word: "Lune", 
            choices_attributes:
            [
            {
                  choice: "Sun", 
            },
            {
                  choice: "Planet", 
            },
            {
                  choice: "Star", 
            },
            {
                  choice: "Moon", 
                  correct:"1",
            }
            ]
      },
      {
            word: "Étoile", 
            choices_attributes:
            [
            {
                  choice: "Star", 
                  correct:"1",
            },
            {
                  choice: "Silius", 
            },
            {
                  choice: "Stage", 
            },
            {
                  choice: "Strange",
            }
            ]
      },
      {
            word: "Bisou", 
            choices_attributes:
            [
            {
                  choice: "Reality", 
            },
            {
                  choice: "Jewel", 
                  correct:"1",
            },
            {
                  choice: "Home", 
            },
            {
                  choice: "Canpany", 
            }
            ]
      },
      {
            word: "Espoir", 
            choices_attributes:
            [
            {
                  choice: "Sadness", 
            },
            {
                  choice: "Happiness", 
            },
            {
                  choice: "Hope", 
                  correct:"1",
            },
            {
                  choice: "Joy", 
            }
            ]
      },
      {
            word: "Famille", 
            choices_attributes:
            [
            {
                  choice: "Farm", 
            },
            {
                  choice: "Form", 
            },
            {
                  choice: "Fantasy", 
            },
            {
                  choice: "Family", 
                  correct:"1",
            }
            ]
      },
      {
            word: "Vérité", 
            choices_attributes:
            [
            {
                  choice: "True", 
                  correct:"1",
            },
            {
                  choice: "False", 
            },
            {
                  choice: "Good", 
            },
            {
                  choice: "Bad", 
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
      word: "朝", 
      choices_attributes:
            [
            {
                  choice: "Noon", 
            },
            {
                  choice: "Morning", 
                  correct:"1",
            },
            {
                  choice: "Evening", 
            },
            {
                  choice: "Night", 
            }
            ]
      },
      {
            word: "水", 
            choices_attributes:
            [
            {
                  choice: "Water", 
                  correct:"1",
            },
            {
                  choice: "Sky", 
            },
            {
                  choice: "Ripple", 
            },
            {
                  choice: "Night", 
            }
            ]
      },
      {
            word: "夢", 
            choices_attributes:
            [
            {
                  choice: "Future", 
            },
            {
                  choice: "Night", 
            },
            {
                  choice: "Dream", 
                  correct:"1",
            },
            {
                  choice: "White", 
            }
            ]
      },
      {
            word: "過去", 
            choices_attributes:
            [
            {
                  choice: "Future", 
            },
            {
                  choice: "Past", 
                  correct:"1", 
            },
            {
                  choice: "Time",
            },
            {
                  choice: "Hour",
            }
            ]
      },
      {
            word: "太陽", 
            choices_attributes:
            [
            {
                  choice: "Sun", 
                  correct:"1",
            },
            {
                  choice: "Planet", 
            },
            {
                  choice: "Star", 
            },
            {
                  choice: "Moon", 
            }
            ]
      },
      {
            word: "変人", 
            choices_attributes:
            [
            {
                  choice: "Star", 
            },
            {
                  choice: "Silius", 
            },
            {
                  choice: "Stage", 
            },
            {
                  choice: "Stranger",
                  correct:"1",
            }
            ]
      },
      {
            word: "現実", 
            choices_attributes:
            [
            {
                  choice: "Reality", 
                  correct:"1",
            },
            {
                  choice: "Jewel", 
            },
            {
                  choice: "Home", 
            },
            {
                  choice: "Canpany", 
            }
            ]
      },
      {
            word: "喜び", 
            choices_attributes:
            [
            {
                  choice: "Sadness", 
            },
            {
                  choice: "Happiness", 
            },
            {
                  choice: "Hope", 
            },
            {
                  choice: "Joy", 
                  correct:"1",
            }
            ]
      },
      {
            word: "幻想", 
            choices_attributes:
            [
            {
                  choice: "Farm", 
            },
            {
                  choice: "Form", 
            },
            {
                  choice: "Fantasy", 
                  correct:"1",
            },
            {
                  choice: "Family", 
            }
            ]
      },
      {
            word: "嘘", 
            choices_attributes:
            [
            {
                  choice: "True", 
            },
            {
                  choice: "False", 
            },
            {
                  choice: "Lie",
                  correct:"1", 
            },
            {
                  choice: "Honesty", 
            }
            ]
}
]

category = Category.second

words.each do |word_params|
      category.words.create!(word_params)
end