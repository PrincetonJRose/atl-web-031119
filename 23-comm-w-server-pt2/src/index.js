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

//PART 3 UPDATE
	//create an edit button
	//attach event listener
	//on edit
		//add edit form onto page 
		//change view
		//update data 

//PART 4 DELETE
	//create a delete button
	//attach an event listener
	//on delete
		//remove from view 
		//delete from backend

document.addEventListener('DOMContentLoaded', function(){

	document.querySelector('#book-form').addEventListener('submit', handleForm)
	document.querySelector('#edit-form').addEventListener('submit', handleEditForm)
	addAllBooks()
})


function addAllBooks(){
	fetchBooks().then(books => books.forEach(addBook))
}

function addBook(book){
	const bookList = document.querySelector("#book-list")

	let div = document.createElement('div')

	div.className = 'card'
	
	div.dataset.id = book.id 

	let img = document.createElement('img')

	img.src = book.img

	let h3 = document.createElement('h3')

	h3.innerText = book.title

	let p = document.createElement('p')

	p.innerText = book.author

	let edit = document.createElement('button')

	edit.innerText = "Edit"

	edit.addEventListener('click', handleEditClick)

	let del = document.createElement('button')

	del.innerText = 'Delete'

	del.addEventListener('click', handleDelete)

	div.appendChild(img)

	div.appendChild(h3)

	div.appendChild(p)
	div.appendChild(edit)
	div.appendChild(del)

	bookList.appendChild(div)
}


function handleDelete(e){

	const bookId = e.target.parentElement.dataset.id
	e.target.parentElement.remove()

	deleteBook(bookId)

}


function handleForm(e){

	e.preventDefault()

	let newBook = {
		title: e.target.title.value,
		author: e.target.author.value,
		img: e.target.cover.value
	}

	addBook(newBook)

	newBook(newBook)
	
	e.target.reset()
}

function handleEditForm(e){
	e.preventDefault()
	// console.log("check it's working", e.target.dataset.id )

	let newBook = {
		title: e.target.title.value,
		author: e.target.author.value,
		img: e.target.cover.value,
		id: e.target.dataset.id
	}
	updateBook(newBook)

}

function handleEditClick(e){

	const card = e.target.parentElement

	let editForm = document.querySelector('#edit-form')

	editForm.dataset.id = e.target.parentElement.dataset.id

	editForm.title.value = card.querySelector('h3').innerText

	editForm.author.value = card.querySelector('p').innerText

	editForm.cover.value = card.querySelector('img').src


}

