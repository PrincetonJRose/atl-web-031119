//all things fetch 

function fetchBooks(){
    return fetch('http://localhost:3000/books')
   .catch((error) => console.log("Error:", error))
   .then((res) => res.json())
   }

function newBook(newBook){

	fetch('http://localhost:3000/books',{
        headers:{
            'Content-Type': 'application/json' 
        },	
        method:'POST',
        body: JSON.stringify(newBook)
        }).then((response)=> console.log(response))


}

function updateBook(book){

    fetch( `http://localhost:3000/books/${book.id}`,{
            
        method: 'PATCH',
        body: JSON.stringify(book),
        headers:{
            'Content-Type': 'application/json'
        }
    })
}

function deleteBook(bookId){
    fetch(`http://localhost:3000/books/${bookId}`,{
        method: 'DELETE'
    })


}