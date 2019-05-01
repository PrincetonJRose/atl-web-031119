// It might be a good idea to add event listener to make sure this file 
// only runs after the DOM has finshed loading.

document.addEventListener('DOMContentLoaded', setUpPage )

function setUpPage(){
    const form = document.getElementById('new-quote-form')
    form.addEventListener('submit', handleNewQuote)

    fetch('http://localhost:3000/quotes')
    .then(res => res.json())
    .then(quotes => addAllQuotes(quotes))

}

function addAllQuotes(quotes){
    quotes.forEach(quote =>{
        addQuote(quote)
    })
}

function addQuote(quote){
    const quoteList = document.getElementById('quote-list')
    let li = document.createElement('li')
    li.className = 'quote-card'
    let blockquote = document.createElement('blockquote')
    blockquote.className = 'blockquote'
    let p = document.createElement('p')
    p.className = 'mb-0'
    p.innerText = quote.quote
    let footer = document.createElement('footer')
    footer.className = 'blockquote-footer'
    footer.innerText = quote.author
    let br = document.createElement('br')
    let btnLikes = document.createElement('button')
    btnLikes.className = 'btn-success'
    btnLikes.innerText = "Likes: "
    let span = document.createElement('span')
    span.innerText = quote.likes
    btnLikes.addEventListener('click', (e)=>{
        handleLikes(e,quote.id)})

    btnLikes.appendChild(span)
    btnLikes.dataset.id = quote.id
    let btnDelete = document.createElement('button')
    btnDelete.className = 'btn-danger'
    btnDelete.innerText = 'Delete'

    blockquote.appendChild(p)
    blockquote.appendChild(footer)
    blockquote.appendChild(br)
    blockquote.appendChild(btnLikes)
    blockquote.appendChild(btnDelete)

    li.appendChild(blockquote)
    quoteList.appendChild(li)
}

function handleNewQuote(e){
    e.preventDefault()
    console.log(e.target.querySelector('#author').value)
    
    let newQuote = {
        quote: e.target.querySelector('#new-quote').value,
        author: e.target.querySelector('#author').value,
        likes: 0 
    }
    persistQuote(newQuote)
    addQuote(newQuote)
}

function persistQuote(quote){
            //how to make my data readable by JSON?
                //JSON.stringify
    fetch('http://localhost:3000/quotes',{
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body:JSON.stringify(quote)
    }).then(res => console.log(res))
    
}

function handleLikes(e,id){
    console.log(e.target.dataset.id)
    let likes = parseInt(e.target.querySelector('span').innerText)
    likes++
    e.target.querySelector('span').innerText = likes
    
    fetch(`http://localhost:3000/quotes/${id}`,{
        method: 'PATCH',
        headers:{
            'Content-Type': 'application/json'
        },
        body:JSON.stringify({
            likes: likes
        })
    }).then(res=> console.log(res))
}
//fetch data from quotes 
    //forEach over data to get a single quote
        //create quote card as li element
            //create elements that go into card
            //add attributes and data
            //query DOM 
            //append quote card to page

//submit quote (persisted)
    //add 'submit' event listener to form
        //getting data from form
            //grab event target     
            //return values of form
        //submit quote to database using fetch
            //use POST method
            //stringify Javascript object of form
            //add headers
        //rerun addQuote to add quote to the page 

//Likes Button 
    //add event listener added to button
        //get value of current likes
        //update by 1
        //put new value back into span
        //persist new value to database

//Delete button
    //create fetch with id
    //set method to DELETE
    //remove li from ul (parent)