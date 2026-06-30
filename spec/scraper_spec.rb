# spec/scraper_spec.rb

require_relative '../lib/scraper'

describe Scraper do
  describe 'Scraper.search_url' do
    it 'returns the default server search URL' do
      expect(Scraper.send(:search_url, 1, nil)).to eq('https://www.gametracker.com/search/cs/')
    end

    it 'returns a map search URL when map is provided' do
      expect(Scraper.send(:search_url, 1, 'cs_mansion')).to eq(
        'https://www.gametracker.com/search/cs/?search_by=map&query=cs_mansion'
      )
    end

    it 'returns a paginated map search URL' do
      expect(Scraper.send(:search_url, 2, 'cs_mansion')).to eq(
        'https://www.gametracker.com/search/cs/?search_by=map&query=cs_mansion&searchpge=2#search'
      )
    end
  end

  describe 'Scraper.parse_servers' do
    it 'returns array of GameServer objects which store server information scraped from website' do
      expect(Scraper.parse_servers.all? { |obj| obj.is_a?(GameServer) && obj.ip_port }).to be_truthy
    end
  end
end
