class UpdateAuthorData < ActiveRecord::Migration[5.2]
  # def up
  # end
  #
  # def down
  # end

  def change
    ## for each book...
    Book.find_each do |book|
      ##   find or create a matching author
      author = Author.find_or_create_by(name: book.author)
      ##   update the book's author_id
      book.update(author_id: author.id)
    end
    ## remove the authors column
    remove_column :books, :author, :string
  end
end
