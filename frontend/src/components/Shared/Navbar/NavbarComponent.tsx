import {
  Navbar,
  Dropdown,
  Button,
  Link,
  Text,
  Avatar,
  useTheme,
} from '@nextui-org/react';
import { Link as LinkRouter } from 'react-router-dom';
import { RootStateOrAny, useDispatch, useSelector } from 'react-redux';
import { icons } from './icons';
import { ShoppingCart } from '../ShoppingCart';
import { useNavigate } from 'react-router-dom';
import { logout } from '../../../redux/actions/auth';

export const NavbarComponent = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { quantity } = useSelector((state: RootStateOrAny) => state.cart);
  const { isAuthenticated } = useSelector(
    (state: RootStateOrAny) => state.user
  );
  const { currentUser } = useSelector((state: RootStateOrAny) => state.user);

  const handleLogout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('id');
    dispatch(logout());
    navigate('/');
  };

  const collapseItems = [
    {
      category: 'Inicio',
      path: '/',
    },
    {
      category: 'cuidado',
      path: '/products/cuidado',
    },
    {
      category: 'tratamientos',
      path: '/products/tratamientos',
    },
    {
      category: 'cosmética',
      path: '/products/cosmética',
    },
  ];

  const { isDark } = useTheme();

  return (
    <Navbar shouldHideOnScroll isBordered={isDark} variant='sticky'>
      <Navbar.Brand>
        <Navbar.Toggle showIn='sm' aria-label='toggle navigation' />
        <img
          src='/logo_tlalli_último_solo_letras.png'
          width={34}
          height={34}
          alt=''
        />
        <Text b color='inherit' hideIn='xs'>
          tu ayuda capilar
        </Text>
      </Navbar.Brand>
      <Navbar.Content enableCursorHighlight hideIn='sm' variant='underline'>
        <Navbar.Link href='/'>Inicio</Navbar.Link>
        <Dropdown isBordered>
          <Navbar.Item>
            <Dropdown.Button
              auto
              light
              css={{
                px: 0,
                dflex: 'center',
                svg: { pe: 'none' },
              }}
              iconRight={icons.chevron}
              ripple={false}
            >
              Categorias
            </Dropdown.Button>
          </Navbar.Item>
          <Dropdown.Menu
            aria-label='ACME features'
            css={{
              $$dropdownMenuWidth: '340px',
              $$dropdownItemHeight: '70px',
              '& .nextui-dropdown-item': {
                py: '$4',
                // dropdown item left icon
                svg: {
                  color: '$secondary',
                  mr: '$4',
                },
                // dropdown item title
                '& .nextui-dropdown-item-content': {
                  w: '100%',
                  fontWeight: '$semibold',
                },
              },
            }}
          >
            <Dropdown.Item
              key='autoscaling'
              showFullDescription
              icon={icons.scale}
            >
              <Link
                href='/products/cuidado'
                key='cuidado'
                css={{
                  minWidth: '100%',
                  paddingTop: '24px',
                  paddingBottom: '24px',
                }}
              >
                cuidado del cabello
              </Link>
            </Dropdown.Item>
            <Dropdown.Item
              key='usage_metrics'
              showFullDescription
              icon={icons.activity}
            >
              <Link
                href='/products/tratamientos'
                key='tratamientos'
                css={{
                  minWidth: '100%',
                  paddingTop: '24px',
                  paddingBottom: '24px',
                }}
              >
                Tratamientos
              </Link>
            </Dropdown.Item>
            <Dropdown.Item
              key='production_ready'
              showFullDescription
              icon={icons.flash}
            >
              <Link
                href='/products/belleza'
                key='belleza'
                css={{
                  minWidth: '100%',
                  paddingTop: '24px',
                  paddingBottom: '24px',
                }}
              >
                Cosmética
              </Link>
            </Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
      </Navbar.Content>
      {isAuthenticated === true ? (
        <Navbar.Content
          css={{
            '@xs': {
              w: '12%',
              jc: 'flex-end',
            },
          }}
        >
          <Link href='/cart' key='cosmética'>
            <ShoppingCart items={quantity} />
          </Link>
          <Dropdown placement='bottom-right'>
            <Navbar.Item>
              <Dropdown.Trigger>
                <Avatar
                  bordered
                  as='button'
                  color='primary'
                  size='md'
                  src={
                    currentUser?.urlImage !== ''
                      ? currentUser?.photoURL
                      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/OOjs_UI_icon_userAvatar.svg/1024px-OOjs_UI_icon_userAvatar.svg.png'
                  }
                />
              </Dropdown.Trigger>
            </Navbar.Item>
            <Dropdown.Menu aria-label='User menu actions' color='secondary'>
              <Dropdown.Item key='profile' css={{ height: '$18' }}>
                <Text b color='inherit' css={{ d: 'flex' }}>
                  Has iniciado como
                </Text>
                <Text b color='inherit' css={{ d: 'flex' }}>
                  {currentUser?.username}
                </Text>
              </Dropdown.Item>
              <Dropdown.Item key='settings' withDivider color='primary'>
                <Link
                  href='/profile'
                  key='tratamientos'
                  css={{
                    minWidth: '100%',
                    color: '#1a29c9',
                    fontWeight: '$semibold',
                  }}
                >
                  Mi Perfil
                </Link>
              </Dropdown.Item>
              {/* <Dropdown.Item key="favorites" withDivider color="secondary">
                                        <Link
                                            href="/favorites"
                                            key="soccer"
                                            css={{
                                                minWidth: "100%",
                                                color: "#e62c17",
                                                fontWeight: "$semibold"
                                            }}
                                        >
                                            Favoritos
                                        </Link>
                                    </Dropdown.Item> */}
              <Dropdown.Item key='purchases' withDivider color='warning'>
                <LinkRouter
                  to='/purchases'
                  key='purchasesLinkRouter'
                  className='pt-2 pb-2 w-full'
                >
                  <button
                    disabled={false}
                    className='w-full text-left disabled:opacity-35 disabled:cursor-not-allowed text-yellow-800 font-semibold'
                  >
                    Mis Compras
                  </button>
                </LinkRouter>
              </Dropdown.Item>
              <Dropdown.Item key='logout' withDivider color='error'>
                <button className='font-semibold' onClick={handleLogout}>
                  Cerrar Sesión
                </button>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown>
        </Navbar.Content>
      ) : (
        <Navbar.Content>
          <Navbar.Link color='inherit' href='/auth/login'>
            Iniciar Sesión
          </Navbar.Link>
          <Navbar.Item>
            <Button auto flat as={Link} href='/auth/signup'>
              Registrarse
            </Button>
          </Navbar.Item>
        </Navbar.Content>
      )}
      <Navbar.Collapse>
        {collapseItems.map((item, index) => (
          <Navbar.CollapseItem key={item.category}>
            <Link
              color='inherit'
              css={{
                minWidth: '100%',
              }}
              href={item.path}
              key={index}
            >
              {item.category}
            </Link>
          </Navbar.CollapseItem>
        ))}
      </Navbar.Collapse>
    </Navbar>
  );
};
