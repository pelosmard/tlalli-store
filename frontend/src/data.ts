export interface category {
  id: number,
  img: string,
  title: string,
  category: string
}

export const categories: category[] = [
  {
    id: 1,
    img: "cuidados_main.jpg",
    title: "CUIDADO",
    category: "cuidado"
  },
  {
    id: 2,
    img: "Tratamientos_main.jpg",
    title: "TRATAMIENTOS",
    category: "tratamientos"
  },
  {
    id: 3,
    img: "belleza_main.jpg",
    title: "PRODUCTOS DE BELLEZA",
    category: "belleza"
  },
];
