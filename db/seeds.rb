countries = %w[日本 アメリカ 中国 インド イスラエル ルワンダ ケニア ナイジェリア]
countries.each { |a| Country.create(name: a)}
