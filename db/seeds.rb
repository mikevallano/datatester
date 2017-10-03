require 'ffaker'

ActiveRecord::Base.transaction do
  50.times do
    user = User.create!(
                        email: FFaker::Internet.email,
                        password: FFaker::Internet.password)
    puts "created user: #{user.email}"
  end

  managers = User.first(10)

  non_managers = User.where.not(id: managers.pluck(:id))

  non_managers.each do |non_manager|
    non_manager.update(manager_id: managers.sample.id)
    puts "manager assigned: #{non_manager.manager}"
  end

  5.times do
    vendor = Vendor.create(name: FFaker::Company.name)
    puts "vendor created: #{vendor.name}"
  end

  5.times do
    category = Category.create(name: FFaker::Product.brand)
  end

  20.times do |i|
    product = Product.create(
                            name: FFaker::Product.product_name,
                            price: rand(10.01..99.99),
                            description: FFaker::Product.product)
    product.categories << Category.all.sample
    puts "product created: #{product.name}"
  end

  Product.all.each do |product|
    product_vendor = ProductsVendor.create(product: product, vendor: Vendor.all.sample)
    puts "product_vendor created: #{product_vendor.id}"
  end

  100.times do
    product_vendor = ProductsVendor.all.sample
    transaction = Transaction.create(
                                      product_id: product_vendor.product_id,
                                      user_id: User.all.sample.id,
                                      ordered_at: (1..7).to_a.sample.days.ago.to_date,
                                      vendor_id: product_vendor.vendor_id)
    puts "transaction created: #{transaction.id}"
  end

end #end transaction
