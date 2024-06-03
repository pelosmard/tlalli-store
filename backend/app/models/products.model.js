module.exports = (sequelize, Sequelize) => {
  const Products = sequelize.define('products', {
    id: {
      type: Sequelize.BIGINT,
      primaryKey: true,
    },
    categories: {
      type: Sequelize.INTEGER,
    },
    color: {
      type: Sequelize.STRING,
    },
    desc: {
      type: Sequelize.STRING,
    },
    img: {
      type: Sequelize.STRING,
    },
    inStock: {
      type: Sequelize.BOOLEAN,
    },
    price: {
      type: Sequelize.DECIMAL(10, 2),
    },
    size: {
      type: Sequelize.STRING,
    },
    title: {
      type: Sequelize.STRING,
    },
    createdAt: {
      type: Sequelize.DATE,
    },
    updatedAt: {
      type: Sequelize.DATE,
    },
  });

  return Products;
};
