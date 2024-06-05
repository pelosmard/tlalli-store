
module.exports = (sequelize, Sequelize) => {
    const Purchase = sequelize.define('purchase', {
      purchaseid: {
        type: Sequelize.BIGINT,
        primaryKey: true
      },
      userid: {
        type: Sequelize.BIGINT
      },
      addressid: {
        type: Sequelize.BIGINT
      },
      totalamount: {
        type: Sequelize.DECIMAL(10, 2)
      },
      statusenum: {
        type: Sequelize.ENUM,
        values: ['Pendiente', 'Entregado']
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
  
    return Purchase;
  };
  