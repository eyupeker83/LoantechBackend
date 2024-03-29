Feature: API_US_01 As a user, I want to access the Ticket List through an API connection.


  Scenario: When a GET request is sent to the user/ticket/list endpoint with valid authorization information,
  the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    #Api kullanicisi user ticket list endpointinden donen responsei gecerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    #Api kullanicisi status codeun 200 oldugunu dogrular
    And The API user verifies that the remark information in the response body is "success"
    #Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular


  Scenario: Verify that when a GET request is sent to the 'user/ticket/list' endpoint with invalid
  authorization information, the returned status code is 401, and the error message in the response
  indicates "Unauthorized request"

    Given The API user sets "user/ticket/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized
    #Api kullanicisi responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular

  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (user_id, name, email, ticket, subject, status, priority, last_reply, created_at, updated_at)

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    Then Verify the information of the one with the id <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"
    #API kullanıcı response body icindeki <dataIndex> indexe sahip olanın bilgilerini doğrular: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name        | email                 | ticket | subject    | status | priority | last_reply         | created_at                | updated_at                |
      |    1      |    46   | kaan karan  |  kaankaran@gmail.com  | 682099 | kaan karan | 0      |    3     | 2023-12-31 11:53:39|2023-12-31T16:53:39.000000Z|2023-12-31T16:53:39.000000Z|



 # {
  #"id": 410,
  #"user_id": 46,
  #"name": "kaan karan",
  #"email": "kaankaran@gmail.com",
  #"ticket": "682099",
  #"subject": "kaan karan",
  #"status": 0,
  #"priority": 3,
  #"last_reply": "2023-12-31 11:53:39",
  #"created_at": "2023-12-31T16:53:39.000000Z",
  #"updated_at": "2023-12-31T16:53:39.000000Z"
  #},