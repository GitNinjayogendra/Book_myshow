namespace :user do
  task :create_user => [:environment] do
  user = [{:username=>"geetanjali", :email=>"geetanjali.codenote@gmail.com", password: "pavi@123", contactnumber:12345}, {:username=>"chetan", :email=>"chetan.codenote@gmail.com", password: "yogi@123", contactnumber:12345}]
    user.each do |user|
      User.create(username: user[:username], email: user[:email], password: user[:password], contactnumber: user[:contactnumber])
      puts "user is created"
    end
  end
end