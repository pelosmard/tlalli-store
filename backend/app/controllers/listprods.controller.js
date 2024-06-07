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
    /*
      const resasjson = productos.map( s => Object.values(s)[0] );
          const resasjson = JSON.parse(productos);
      console.log(resasjson);
      const jsontostrng = JSON.parse(resasjson);
      console.log(jsontostrng);
    */
      //res.status(200).send({ message: 'Van productos', productos });
      res.status(200).send(productos);
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
