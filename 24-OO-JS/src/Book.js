class Book{

    constructor(title, author, img, id){

        this.title = title
        this.author = author
        this.img  = img
        this.id = id
    }

    getBookView =()=>{
        
	let div = document.createElement('div')

	div.className = 'card'
	
	div.dataset.id = this.id

	let img = document.createElement('img')

	img.src = this.img

	let h3 = document.createElement('h3')

	h3.innerText = this.title

	let p = document.createElement('p')

	p.innerText = this.author

    div.appendChild(img)

	div.appendChild(h3)

    div.appendChild(p)
    
    return div 
    }

}