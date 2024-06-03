import Categories from '../components/Categories'
import { Slidercarrousel } from '../components/Shared/Slider'
import { Products } from '../components/Products';
import { Footer } from '../components/Shared/Footer';

export const Home = () => {
    return (
        <div className="home">    
            <Slidercarrousel /> 
            <Categories />
            <Products />
            <Footer />
        </div>
    ) 
}

