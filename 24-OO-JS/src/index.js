

let bookList = new BookList()
document.addEventListener('DOMContentLoaded', ()=>{
    fetchBooks()
})

function fetchBooks(){
    return fetch('http://localhost:3000/books')
   .catch((error) => console.log("Error:", error))
   .then((res) => res.json())
   .then(renderPage)
   }

function renderPage(books){
    books.forEach(book=>{let newBook = new Book(book.title, book.author, book.img, book.id)

    bookList.books.push(newBook)})

    bookList.createView()
}


