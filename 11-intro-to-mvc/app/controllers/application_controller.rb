class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  self.get('/') do
    "This is just me testing something..."
  end

  # get '/' do
  #   "<h1 style='color: blue'>Hello World</h1>"
  # end

  get '/books' do
    @books = Book.all
    erb(:books)
  end

  get '/cats' do
    "<img src=\"https://i.redd.it/pr1iq6ot4mp21.jpg\" />"
  end

  get '/do-a-fright' do
    system("say 'hello roni'")
    "all done"
  end

  # get '/products/:id' do
  #   @product = Product.find(...id?)
  #
  # end

end
