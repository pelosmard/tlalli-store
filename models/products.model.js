module.exports = (sequelize, Sequelize) => {
  const Products = sequelize.define('products', {
    productid: {
      type: Sequelize.BIGINT,
      primaryKey: true
    },
    categories: {
      type: Sequelize.INTEGER
    },
    desc: {
      type: Sequelize.STRING
    },
    color: {
      type: Sequelize.STRING
    },
    img: {
      type: Sequelize.STRING
    },
    inStock: {
      type: Sequelize.BOOLEAN
    },
    price: {
      type: Sequelize.DECIMAL(10, 2)
    },
    sizeenum: {
      type: Sequelize.enum,
      values:  ['125Ml.', '250Ml', '500Ml', '1000Ml']
    },
    title: {
      type: Sequelize.STRING
    },
    createdAt: {
      type: Sequelize.DATE
    },
    updatedAt: {
      type: Sequelize.DATE
    }
  });

  return Products;
};
