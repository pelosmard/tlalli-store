module.exports = (sequelize, Sequelize) => {
  const User = sequelize.define("users", {
    userid: {
      type: Sequelize.BIGINT,
      primaryKey: true
    },
    username: {
      type: Sequelize.STRING
    },
    password: {
      type: Sequelize.STRING
    },
    type: {
      type: Sequelize.STRING
    },
    email: {
      type: Sequelize.STRING
    }
  });

  return User;
};
