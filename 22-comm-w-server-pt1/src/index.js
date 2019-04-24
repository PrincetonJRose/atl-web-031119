//**** Communication with Server****///

//PART 1
//fetch from url
	//render data from fetch
	//create renderAllBooks
	//create renderBook

//PART 2 
//add a book
	//send that data to api via fetch
	//call renderbook

document.addEventListener('DOMContentLoaded', function(){

	document.querySelector('form').addEventListener('submit', handleForm)

})

fetch('http://localhost:3000/books')
.catch((error) => console.log("Error:", error))
.then(function(res) {
	return res.json()})
.then((books) => addAllBooks(books))

addAllBooks = (books) =>{
	books.forEach(book => addBook(book))
}

addBook = function(book){
	const bookList = document.querySelector("#book-list")

	let div = document.createElement('div')

	div.className = 'card'

	let img = document.createElement('img')

	img.src = book.img

	let h3 = document.createElement('h3')

	h3.innerText = book.title

	let p = document.createElement('p')

	p.innerText = book.author

	div.appendChild(img)

	div.appendChild(h3)

	div.appendChild(p)

	bookList.appendChild(div)
}

function handleForm(e){

	e.preventDefault()

	let newBook = {
		title: e.target.title.value,
		author: e.target.author.value,
		img: e.target.cover.value
	}

	addBook(newBook)

	fetch('http://localhost:3000/books',{
	headers:{
		'Content-Type': 'application/json' 
	},	
	method:'POST',
	body: JSON.stringify(newBook)
	}).then((response)=> console.log(response))

	e.target.reset()

}




