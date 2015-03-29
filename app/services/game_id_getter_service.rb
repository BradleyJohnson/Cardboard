require 'open-uri'
require 'nokogiri'
require 'json'
require 'active_support/core_ext'

class GameIdGetter
  attr_reader :id_array

  def initialize(array)
    @url_array = array
    @id_array = []
  end

  def call
    @url_array.each do |page|
      document = Nokogiri::HTML(open(page))
      anchors = document.css("table.collection_table td.collection_thumbnail a")

      anchors.each do |x|
        array = x.attr("href").split("/")
        @id_array.push(array[2])
      end
      print "."
      sleep 1
    end

  end

end
