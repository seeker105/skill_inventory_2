require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true  # this allows us to use _method in the form

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = skill_inventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :show
  end

  def skill_inventory
    @skill_inventory ||= SkillInventory.new
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    skill_inventory.destroy(id.to_i)
    redirect '/skills'
  end

end
