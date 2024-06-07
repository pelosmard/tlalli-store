const db = require('../models');
const config = require('../config/auth.config');
const Products = db.products;

const Op = db.Sequelize.Op;

var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');

exports.listprods = (req, res) => {
  console.log('Entró a listprods');

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
      order: [['productid', 'DESC']],
    }).then(function (prods) {
      console.log(prods);
      console.log(Products);
      res.status(200).send({ message: 'Van productos', prods });
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
