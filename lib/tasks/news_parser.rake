require 'open-uri'

namespace :news_parser do
  desc 'Parsing news from 6 news sites'
  task parse_news: :environment do
    load 'lib/news_parser.rb'
    [VikkaParser, ProcherkParser, InfomistParser, VycherpnoParser, ProvceParser, NovaDobaParser].each do |parser_class|
      parser_class.new.save_novelties
    end
  end
end
