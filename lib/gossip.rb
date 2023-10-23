require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author = "", content = "")
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
        if (@author.length > 0 && @content.length > 0) # verifier que les champs remplis ne soient pas vides
            csv << [@author, @content]
        end
    end
  end

  def all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1]) # boucle sur chaque ligne du CSV et stock dans un tableau d'objets Gossip
    end
    return all_gossips
  end
end

