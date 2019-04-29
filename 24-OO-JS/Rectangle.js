class Rectangle {

    constructor(width,height){
        this.height = height
        this.width  = width
    }

    getArea() { 
        return this.height * this.width
    }
}

let rectangle = new Rectangle(4,5)

console.log(rectangle.getArea())

console.log("Rectangle", rectangle)

