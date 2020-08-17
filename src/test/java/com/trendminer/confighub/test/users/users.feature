Feature: sample karate test script

  Background:
    # Log-in process, Check karate-config.js for appCredentials
    * url loginUrl
    And form field username = appUsername
    And form field password = appPassword
    When method post
    Then status 200
    # Load base url
    * url baseUrl
    # Define some useful functions
    * def nameGenerator = function(){ return 'ITEST-' + java.lang.System.currentTimeMillis() + '' }
    * def uuidGenerator = function(){ return java.util.UUID.randomUUID() + '' }
    # Load afterFeature file for cleaning up
    * configure afterFeature = function(){ karate.call('cleanup.feature'); }

  Scenario: get all users and then get the first user by id
    Given path 'users'
    And path 'all'
    And param enabled = 'true'
    When method get
    Then status 200

#    * def first = response.content[0]
#
#    Given path 'users', first.id
#    When method get
#    Then status 200

  Scenario: create a user and then get it by id and then delete it
    * def user =
      """
        {
          "username" : #(nameGenerator()),
          "password" : #(uuidGenerator()),
          "email" : #(uuidGenerator()),
          "firstName" :  #(uuidGenerator()),
          "lastName" :  #(uuidGenerator())
        }
      """

    Given path 'users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    Given path 'users'
    And path id
    When method get
    Then status 200
    * match response ==
    """
    {
      "username": ##notnull,
      "id": ##notnull,
      "email": '#uuid',
      "firstName": '#uuid',
      "lastName": '#uuid',
      "password": '#ignore',
      "isLocal": true
    }
    """

    Given path 'users'
    And path id
    When method delete
    Then status 200