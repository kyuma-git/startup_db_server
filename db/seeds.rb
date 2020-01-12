countries = %w[日本 アメリカ 中国 インド イスラエル ルワンダ ケニア ナイジェリア]
countries.each { |a| Country.create(name: a)}

funding_stages = %w[Bootstraped Pre_seed Startup Seed Beta A B C+]
funding_stages.each { |a| FundingStage.create(name: a)}
