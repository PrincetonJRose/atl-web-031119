class BookList{

    constructor(books =[]){
        this.books = books
    }

    createView= ()=>{
     const bookList = document.querySelector("#book-list")
        this.books.forEach(book=>{
            console.log("book view", book.getBookView())
            bookList.appendChild(book.getBookView())

        })
    }

}