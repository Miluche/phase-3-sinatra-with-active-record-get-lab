class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    ordered_goods = BakedGood.order(price: :desc)
    ordered_goods.to_json
  end
  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.maximum(:price)
    most_expensive_baked_good = BakedGood.find_by(price: most_expensive)
    most_expensive_baked_good.to_json
  end
end
