require 'nokogiri'
require 'httparty'
require 'net/ping'
require 'uri'
require_relative '../lib/game_server'

class Scraper
  @@page_itr = 1

  private_class_method def self.search_url(page, map)
    query_params = {}
    query_params[:search_by] = 'map' unless map.nil? || map.empty?
    query_params[:query] = map unless map.nil? || map.empty?
    query_params[:searchpge] = page if page > 1

    query = URI.encode_www_form(query_params)
    url = 'https://www.gametracker.com/search/cs/'
    url += "?#{query}" unless query.empty?
    url += '#search' if page > 1
    url
  end

  private_class_method def self.scrap_list(page, map)
    url = search_url(page, map)
    body = HTTParty.get(url).body
    doc = Nokogiri::HTML(body)
    doc
  end

  def self.parse_servers(map = nil)
    doc = scrap_list(@@page_itr, map)
    game_servers = []

    puts "\nTesting ping rates and parsing info...\n\n"
    doc.css('.table_lst.table_lst_srs tr').each do |tr|
      name = tr.css('a[href^="/server_info"]').text.strip
      ip = tr.css('span.ip').text
      port = tr.css('span.port').text.delete(':')
      server = Net::Ping::External.new(ip, port, 1) unless ip.empty?
      game_servers << GameServer.new(name, server.host, server.port, (server.duration * 1000).round) if server&.ping?
    end

    @@page_itr += 1
    game_servers
  end
end
