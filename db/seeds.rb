Category.delete_all
User.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')

User.create(name: "Shahadat Hossain", email:"shahadat3669@gmail.com", password:"password")
User.create(name: "Shahadat Hossain", email:"shahadat@dev.com", password:"password")


User.all.each do |user|
  folder_path = "#{Rails.root}/app/assets/images/categories"

  Dir.glob("#{folder_path}/*.png") do |image_file|
    basename = File.basename(image_file, '.*')
    category_name = basename.gsub(/-/, ' ').split.map(&:capitalize).join(' ')

    category = Category.new(name: category_name, user: user)
    file = File.open(image_file)
    category.icon.attach(io: file, filename: File.basename(image_file), content_type: 'image/png')
    category.save!
  end
end