class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  def initialize
    super
    puts "I just built a brand new controller. Woohoo!\n\n\n"
    puts self
  end

  self.get('/') do
    "This is just me testing something..."
  end

  # get '/' do
  #   "<h1 style='color: blue'>Hello World</h1>"
  # end

  get '/books' do
    if params['query']
      # @books = Book.where(title: "cookies")
      @query = params['query']
      @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    else
      @books = Book.all
    end
    erb(:books)
  end

  get '/books/new' do
    ## if params[:title] != nil
    ##   Book.create .....
    ##   redirect to the new book's page
    ## else
    ##   erb :new
    ## end
    erb :new
  end

  post '/books' do
    @book = Book.create(title: params[:title],
                        author: params[:author] || 7,
                        snippet: params[:snippet])
    redirect "/books/#{@book.id}"
  end

  get '/books/:id' do
    # @books = Book.all
    @book = Book.find(params[:id])
    erb :show
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
