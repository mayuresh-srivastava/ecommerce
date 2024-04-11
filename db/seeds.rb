# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'
ENTITIES = %w[merchant shopper]

ENTITIES.each do |entity|
  file = "#{Rails.root}/#{entity}s.csv"
  CSV.foreach(file) do |row|
    object = case entity
             when 'merchant'
               entity.capitalize.constantize.new(name: row[1], email: row[2], cif: row[3])
             when 'shopper'
               entity.capitalize.constantize.new(name: row[1], email: row[2], nif: row[3])
             end
    object.save
  end
end

order_rows = []
CSV.foreach("#{Rails.root}/orders.csv") do |row|
  order_rows << row
end

# sort in place by the 1st(ID) column
order_rows.sort_by! { |row| row[0].to_i }

order_rows.each do |row|
  order = Order.new(merchant_id: row[1], shopper_id: row[2], amount: row[3], created_at: row[4], completed_at: row[5])
  order.save
end

User.create(name: 'User 1', email: 'user1email')
36.times { Post.create(text: 'Post 1 text', user_id: User.first) }
7.times { PostLike.create(post_id: Post.last, user_id: User.first) }
