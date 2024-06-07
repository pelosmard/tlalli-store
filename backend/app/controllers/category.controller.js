const db = require('../models');
const config = require('../config/auth.config');
const querystring = require('querystring');
const url = require('node:url');
const Products = db.products;

const Op = db.Sequelize.Op;

var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');

exports.lisxcategory = (req, res) => {
  //console.log('Entró a lisxcategory');
  let idCategory = req.params.idCategory;

  const cat0 = req.query !== undefined ? parseInt(req.query) : 1;
  const qry = req.query;
  const parm= req.params;
  const categ = req.query.category;
  // const myURL = new URL(req);
  // const cat = myURL.searchParams.get('category');

  //console.log(JSON.stringify(req.query));
  //console.log(cat0);
  //console.log(cat);

  try {
    Products.findAll({
      /*
      attributes: [
        'productid',
        'categories',
        'desc',
        'color',
        'img',
        'inStock',
        'price',
        'sizenum',
        'title',
        'createdAt',
        'updatedAt',
      ],
      */
      raw: true,
      where: {
        categories: idCategory,
      },
    }).then(function (prods) {
      console.log(prods);
      console.log(Products);
      res.status(200).send({ message: 'Van productos x categoria', prods });
    });
    /*
      .then(res.status(200).send({ message: 'Van productos', Products })){
        console.log(Products);
      };
  */
  } catch (error) {
    res.status(500).send({ message: err.message });
  }
};
