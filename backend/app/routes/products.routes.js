const { verifySignUp } = require("../middleware");
const prodsController = require("../controllers/listprods.controller");
const categoryController = require("../controllers/category.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  console.log("Entró a products.routes");

  app.get("/api/products", prodsController.listprods);
  app.get("/api/products/find/:productId", prodsController.findprod);
  app.get("/api/products/category/:idCategory", categoryController.lisxcategory);

};
