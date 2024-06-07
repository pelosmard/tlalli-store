export interface category {
  id: number,
  src: string,
  title: string,
  category: string
}

const src1 = process.env.PUBLIC_URL + "/cuidados_main.jpg";
const src2 = process.env.PUBLIC_URL + "/Tratamientos_main.jpg";
const src3 = process.env.PUBLIC_URL + "/belleza_main.jpg";

console.log(src1);
export const categories: category[] = [
  {
    id: 1,
    src: src1,
    title: "CUIDADO",
    category: "cuidado"
  },
  {
    id: 2,
    src: src2,
    title: "TRATAMIENTOS",
    category: "tratamientos"
  },
  {
    id: 3,
    src: src3,
    title: "PRODUCTOS DE BELLEZA",
    category: "belleza"
  },
];
