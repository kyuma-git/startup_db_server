countries = %w[日本 アメリカ 中国 インド イスラエル ルワンダ ケニア ナイジェリア]
countries.each { |a| Country.create(name: a)}

funding_stages = %w[Seed Early Later IPO その他]
funding_stages.each { |a| FundingStage.create(name: a)}
