require 'ffaker'

ActiveRecord::Base.transaction do
  50.times do
    user = User.create(
                        email: FFaker::Internet.email,
                        password: FFaker::Internet.password)
    puts "created user: #{user.email}"
  end

  5.times do
    category = Category.create(name: FFaker::Product.brand)
  end

  10.times do |i|
    product = Product.create(
                            name: FFaker::Product.product_name,
                            price: rand(10.01..99.99))
    product.categories << Category.all.sample
    puts "product created: #{product.name}"
  end

  100.times do
    transaction = Transaction.create(
                                      product_id: Product.all.sample.id,
                                      user_id: User.all.sample.id,
                                      ordered_at: (1..7).to_a.sample.days.ago.to_date)
    puts "transaction created: #{transaction.id}"
  end

end #end transaction
