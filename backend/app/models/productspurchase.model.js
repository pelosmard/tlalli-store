module.exports = (sequelize, Sequelize) => {
    const Productspurchase = sequelize.define('productspurchase', {
      purchaseid: {
        type: Sequelize.BIGINT,
        primaryKey: true
      },
      productid: {
        type: Sequelize.BIGINT,
        primaryKey: true
      },
      title: {
        type: Sequelize.STRING
      },
      img: {
        type: Sequelize.STRING
      },
      quantity: {
        type: Sequelize.INTEGER
      }
    });

    return Productspurchase;
  };
  
        