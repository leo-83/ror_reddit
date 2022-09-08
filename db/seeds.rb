# seed file is for populating the db
# use active record -> sql to apply to the db

# we need to reset before we create 
Sub.delete_all 

Sub.create(title: 'Zelda')
Sub.create(title: 'Ganondorf')
Sub.create(title: 'Link')

5.times do
  Sub.create(
    # faker helps out with giving fake data
    title: Faker::Games::Zelda.character
  )
end