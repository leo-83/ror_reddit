# seed file is for populating the db
# use active record -> sql to apply to the db

# we need to reset before we create 
Sub.delete_all 

Sub.create(title: 'Food')
Sub.create(title: 'Travel')
Sub.create(title: 'Tech')

5.times do
  Sub.create(
    # faker helps out with giving fake data
    title: Faker::Games::SuperMario.character
  )
end