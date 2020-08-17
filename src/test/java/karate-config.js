function fn() {
  // var env = karate.env; // get java system property 'karate.env'
  var baseUrl = karate.properties['karate.baseUrl'];
  var loginUrl = karate.properties['karate.loginUrl'];
  var config = { // base config JSON
    appUsername: 'admin',
    appPassword: 'admin',
    baseUrl: baseUrl,
    loginUrl: loginUrl
  };

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}