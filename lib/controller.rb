require 'sinatra'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    # recuperer tous les elements Gossip et les stocker
    # dans la variable local "gossips" pour pouvoir l'utiliser dans la view
    erb :index, locals: {gossips: Gossip.new.all()}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/test/' do
    puts("HELLO")
  end

  post '/gossips/new/' do
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
    puts params.inspect
    # Ajoutez votre logique de traitement des données du formulaire ici
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/' # Redirigez l'utilisateur vers la page d'accueil ou toute autre page souhaitée après la soumission du formulaire
  end
end