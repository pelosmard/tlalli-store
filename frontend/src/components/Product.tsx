import { Link } from 'react-router-dom';

export const Product = ({ item }: any) => {

    function truncate(str, n) {
        return (str.length > n) ? str.slice(0, n - 1) + '...' : str;
    }

    //var imgURL = item.img  + ".jpg";
    const  imgURL = item.img;
    return (
        <div className='w-80 productContainer'>
            <Link to={`/product/${item.id}`}>
                <div className="product">
                    <div className='imageContainer'>
                        {/* <ImageSlider images={item?.img} /> */}
                        {/*<img className='image' src={item.img} alt="" />*/}
                        <img className='image' src={imgURL}  alt="" />
                    </div>
                </div>
            </Link>
            <div className="productInfo">
                <p className='titleProduct'>{truncate(item.title, 35)}</p>
                <div className='priceStock'>
                    <p className='price'>${item.price}</p>
                    <p className={item.inStock ? 'inStock' : 'notAvailable'}>{item.inStock ? 'Disponible' : 'Agotado'}</p>
                </div>
            </div>
        </div>
    )
}


