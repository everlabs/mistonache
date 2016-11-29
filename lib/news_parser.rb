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
    novelty.source = 'procherk.info'
    novelty.body = page.css('.rt-article p').slice(0...-2).text
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
    novelty.source = 'vikka.ua'
    novelty.body = page.css('.article-txt p').text
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
    novelty.title = page.at_css('#main h1:nth-child(3)').text
    novelty.source = 'infomist.ck.ua'
    novelty.body = page.css('.content-wrapp p').text
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

class ZmiParser
  BASE_URL = 'http://zmi.ck.ua/'

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
    novelty.title = page.at_css('.news_one h2').text
    novelty.source = 'zmi.ck.ua'
    novelty.body = page.css('#news-text p').text
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'news').css('.col-md-8 a').each_with_object([]) do |link, array|
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
    novelty.source = 'vycherpno.ck.ua'
    novelty.body = page.css('.entry-content p').text
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
    novelty.title = page.at_css('h2').text
    novelty.source = 'provce.ck.ua'
    novelty.body = page.css('.entry-content p').text
    novelty.save
  end

  def parse_novelties_urls
    @novelties_urls ||= load_page(BASE_URL + 'category/novini/').css('.news a').each_with_object([]) do |link, array|
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