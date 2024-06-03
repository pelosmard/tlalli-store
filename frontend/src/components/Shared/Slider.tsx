import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
//import styles from '../../styles/components/Shared/_StyleSlider.scss';
import TlalliStyles from './TlalliStyles';

export const Slidercarrousel = () => {
  const settings = {
    dots: true,
    speed: 4500,
    slidesToShow: 1,
    slidesToScroll: 1,
    infinite: true,
    autoplay: true,
    autoplaySpeed: 1500,
    //lazyLoad: true,
    nextArrow: (
      <div>
        <div className='next-slick-arrow'>
          <svg
            xmlns='http://www.w3.org/2000/svg'
            stroke='black'
            height='24'
            viewBox='0 -960 960 960'
            width='24'
          >
            <path d='m242-200 200-280-200-280h98l200 280-200 280h-98Zm238 0 200-280-200-280h98l200 280-200 280h-98Z' />
          </svg>
        </div>
      </div>
    ),
    prevArrow: (
      <div>
        <div className='next-slick-arrow rotate-180'>
          <svg
            xmlns='http://www.w3.org/2000/svg'
            stroke='black'
            height='24'
            viewBox='0 -960 960 960'
            width='24'
          >
            <path d='m242-200 200-280-200-280h98l200 280-200 280h-98Zm238 0 200-280-200-280h98l200 280-200 280h-98Z' />
          </svg>
        </div>
      </div>
    ),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 1,
        },
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  };

  return (
    <section className='container mx-auto full-height text-gray-800'>
      <div className='container' style={{ padding: '20 20 30' }}>
        <Slider {...settings}>
          {TlalliStyles.map((item) => (
            <div key={item.id} className='styleSlider'>
              <article className='article'>
                <picture className='picture'>
                  <source media='(min-width: 0px)' srcSet={item.src} />
                  <img src={item.src} alt={item.alt} />
                </picture>
                <h1 className='header'>{item.description}</h1>
              </article>
            </div>
          ))}
        </Slider>
      </div>
    </section>
  );
};
