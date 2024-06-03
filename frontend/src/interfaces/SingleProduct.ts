

export type Product = {
    _id: string,
    categories: string[],
    color: string[],
    createdAt: Date,
    desc: string,
    img: string,
    inStock: boolean,
    price: number,
    size: string[],
    title: string,
    updatedAt: Date
}

export type SingleProductResponse = {
    data: Product
}
