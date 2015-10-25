require 'net/http'
require 'rexml/document'

class MainController < ApplicationController

  Article = Struct.new(:title, :link)

  MEMBERS = {
    "ましゅー" => {
      name: "たかやま　しゅうへい",
      age: 22,
      hobby: "天体観測"
    },
    "こばやし" => {
      name: "こばやし　りょうすけ",
      age: 23,
      hobby: nil
    }
  }

  def index
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
  end

  def about
    who = params[:who]
    @profile = MEMBERS[who]
  end

  def sample
    uri = URI.parse("http://alfalfalfa.com/index.rdf")
    res = Net::HTTP.get uri
    xml = REXML::Document.new(res)
    @articles = []
    xml.elements.first.elements.each("item") do |e|
      title = e.elements['title'].text
      link = e.elements['link'].text
      @articles << Article.new(title, link)
    end
  end

end
