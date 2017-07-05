class VikkaParser
  BASE_URL = 'http://vikka.ua/'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.at_css('.article h1').text
    novelty.url = url
    novelty.source = 'vikka.ua'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'news/').css('.txt a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end

end

class ProcherkParser
  BASE_URL = 'http://procherk.info'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(BASE_URL + url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.css('h1 a').text
    novelty.url = url
    novelty.source = 'procherk.info'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + '/news').css('.junews-feed .junews-title a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end

end

class InfomistParser
  BASE_URL = 'http://infomist.ck.ua/'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.at_css('#main h1').text
    novelty.url = url
    novelty.source = 'infomist.ck.ua'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + '30-2/').css('h2 a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end
end

class VycherpnoParser
  BASE_URL = 'http://vycherpno.ck.ua/'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.at_css('.entry-header h1').text
    novelty.url = url
    novelty.source = 'vycherpno.ck.ua'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'news/').css('h2 a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end
end

class ProvceParser
  BASE_URL = 'http://provce.ck.ua/'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.at_css('.post-title h1').text
    novelty.url = url
    novelty.source = 'provce.ck.ua'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'category/novini/').css('.news-list .clearfix.item a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end
end

class NovaDobaParser
  BASE_URL = 'http://novadoba.com.ua/'

  def initialize
    @time = Time.new
  end

  def save_novelties
    parse_novelties_urls.each do |url|
      save_novelty(url)
    end
    'done'
  end

  private

  def save_novelty(url)
    begin
      page = load_page(url)
    rescue
      return
    end
    novelty = Novelty.new
    novelty.title = page.at_css('h1 a').text
    novelty.url = url
    novelty.source = 'novadoba.com.ua'
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'novyny/').css('.newsfoto .indexText-Bold2 a').each_with_object([]) do |link, array|
      array << link['href']
    end
  end

  def load_page(url)
    until Time.new - @time > 3
      sleep 1
    end
    page = Nokogiri::HTML(open(url))
    @time = Time.new
    page
  end
end