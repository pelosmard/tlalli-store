
import { categories, category } from '../data';
import Category from './Category';

const Categories = () => {
    return (
        <div className="container mx-auto full-height" style={{paddingTop: "30px"}}>
            <div className='categories'>
                {
                    categories.map((category: category) => {
                        return <Category key={category.id} item={category} />;
                    })
                }
            </div>
        </div>
    )
}

export default Categories
