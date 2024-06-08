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
      attributes: [
        ['productid', 'id'],
        'title',
        'desc',
        'img',
        'categories',
        'sizenum',
        'color',
        'price',
        'inStock',
        'createdAt',
        'updatedAt',
      ],
      raw: true,
      order: [['id', 'DESC']],
    }).then(function (productos) {
      console.log(productos);
      res.status(200).send(productos);
    });
  } catch (error) {
    res.status(500).send({ message: err.message });
  }
};

exports.findprod = (req, res) => {
  console.log('Entró a findprod');
  const productId = req.params.productId;

  try {
    Products.findByPk(productId, {
      attributes: [
        ['productid', 'id'],
        'title',
        'desc',
        'img',
        'categories',
        'sizenum',
        'color',
        'price',
        'inStock',
        'createdAt',
        'updatedAt',
      ],
    }).then(function (producto) {
      console.log(producto);
      res.status(200).send(producto);
    });
  } catch (error) {
    res.status(500).send({ message: err.message });
  }
};
