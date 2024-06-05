const config = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    host: config.HOST,
    dialect: config.dialect,
    pool: {
      max: config.pool.max,
      min: config.pool.min,
      acquire: config.pool.acquire,
      idle: config.pool.idle
    }
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("../models/user.model.js")(sequelize, Sequelize);
db.role = require("../models/role.model.js")(sequelize, Sequelize);
db.products = require("../models/products.model.js")(sequelize, Sequelize);
db.address = require("../models/address.model.js")(sequelize, Sequelize);
db.purchase = require("../models/purchase.model.js")(sequelize, Sequelize);

db.role.belongsToMany(db.user, {
  through: "user_roles"
});
db.user.belongsToMany(db.role, {
  through: "user_roles"
});

db.address.belongsTo(db.purchase);

db.purchase.belongsTo(db.user);

db.products.belongsToMany(db.purchase, {
  through: "productspurchase"
});

db.purchase.belongsToMany(db.products, {
  through: "productspurchase"
});

db.ROLES = ["user", "admin", "moderator"];

module.exports = db;
