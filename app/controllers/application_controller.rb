require 'sinatra/base'

class App < Sinatra::Base
   set :views, Proc.new { File.join(root, "../views/") }
  get '/' do
    erb :new
  end

  post '/teams' do
   @team_name = params[:team][:name]
   @team_motto = params[:team][:motto]
   @hero_name = []
   @hero_power = []
   @hero_bio = []
   @team_members = params[:team][:members]
   
   @team_members.each do |hero, att|
   @hero_name << att[:name]
   @hero_power << att[:power]
   @hero_bio << att[:bio]
   end
    erb :team
  end
end
