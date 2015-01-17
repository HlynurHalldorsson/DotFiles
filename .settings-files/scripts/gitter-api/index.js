'use strict';

var superagent = require('superagent');
var config = require('./config.json');
var fs = require('fs');

if (new Date() % 60000 < 6000) {
  superagent
    .get([config.api, 'user', config.userID, 'unreadItems'].join('/'))
    .set('Authorization', 'Bearer ' + config.token)
    .set('Accept', 'application/json')
    .end(function(err, res) {
      var sum = 0;
      res.body.forEach(function(room) {
        sum += room.unreadItems;
      });
      fs.writeFile(require('path').dirname(require.main.filename) + '/unread.txt', 'Unread items: ' + sum, function(err, data) {
        if (err)  { 
          //:( 
          console.log('ERROR');
          console.log(err);
        }
      });
  });
}
