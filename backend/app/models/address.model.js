module.exports = (sequelize, Sequelize) => {
    const Address = sequelize.define('address', {
      addressid: {
        type: Sequelize.BIGINT,
        primaryKey: true
      },
      line1: {
        type: Sequelize.STRING
      },
      country: {
        type: Sequelize.STRING
      },
      state: {
        type: Sequelize.STRING
      },
      city: {
        type: Sequelize.STRING
      },
      postal_code: {
        type: Sequelize.BOOLEAN
      }
    });
  
    return Address;
  };