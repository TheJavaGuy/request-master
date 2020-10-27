'use strict';

var tape = require('tape');
var request = require('../../index');

tape('returns on error', function (t) {
  t.plan(1);
  request({
    uri: 'https://stupid.nonexistent.path:port123/\\<-great-idea',
    withCredentials: false
  }, function (error, response) {
    t.equal(typeof error, 'object');
    t.end();
  });
});

tape('succeeds on valid URLs (with https and CORS)', function (t) {
  t.plan(1);
  request({
    uri: __karma__.config.requestTestUrl, // eslint-disable-line no-undef
    withCredentials: false
  }, function (_, response) {
    t.equal(response.statusCode, 200);
    t.end();
  });
});
