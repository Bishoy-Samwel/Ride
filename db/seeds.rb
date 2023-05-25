# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

unless AdminUser.exists?(email: 'admin@example.com') || !Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

STYLES_DATA = %w[Road Mountain Hybrid]

DESC_DATA = {
  Road: 'Road bicycles are designed to be ridden fast on smooth pavement. They have smooth, skinny tires and drop handlebars, and can be used for on-road racing. They are usually lighter than other types of bicycles. They can be ridden on paved trails, but most people find them uncomfortable and unstable on unpaved trails. Most road bikes are not capable of carrying heavy loads, so are not very suitable for commuting or touring.',
  Mountain: "
  Mountain Bicycles are design for riding rough off-road trails. They have flat or upright handlebars, and a very low gear range for pedaling up steep trails. Most mountain bikes have some type of shock absorbers or suspension. Mountain bikes with front suspension only are called hardtails; mountain bikes with both front and rear suspension are called full-suspension bikes or duallies. Mountain bikes with no suspension are called rigid. Mountain bikes can be outfitted for use as touring or commuting bikes, although they would not be as light or efficient as traditional touring or commuting bikes. Fat bikes, with their extremely wide tires, are included in the mountain bike category.",
  Hybrid: 'Hybrid Bicycles were originally conceived to provide the advantages of both road bikes and mountain bikes. Their large, padded seats and upright handlebars provide a comfortable riding position, and are best for casual riding around the neighborhood or bike paths, short-distance commuting, and errands around town. They can be ridden on paved roads, but are not as lightweight or efficient as road bikes. They are ideal for paved or unpaved bike trails, but are not appropriate for rough off-road mountain bike trails. The tires are usually a medium-width with a semi-smooth tread, to provide a fairly smooth ride on pavement, but enough grip and cushion on unpaved trails. Most hybrid bikes have front suspension to smooth out small bumps, but some are fully rigid. Hybrid bikes used to also be referred to as cross bikes, but that term is not used any more in order to avoid confusion with cyclocross bikes (see above).'
}

STYLES_DATA.each do |name|
  style = Style.new(name: name)
  style.save
end

STYLES_DATA.each do |style_name|
  2.times do |i|
    bike = Bike.new(
      name: ("cat_#{i}_" + style_name + ''),
      style: Style.find_by(name: style_name),
      desc: DESC_DATA[style_name.to_sym],
      price: i + 1
    )
    image = File.open("./app/assets/images/bikes/#{style_name}#{i + 1}.jpeg", 'r')
    # image = File.open(Rails.root.join('app', 'assets', 'images', 'bikes', `#{style_name}#{i+1}.jpeg`))
    bike.image.attach(io: image, filename: "#{style_name}#{i + 1}.jpeg")
    bike.save
  end
end
