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