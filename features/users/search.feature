Feature: Search for users

  We want to search users by name

  Scenario: Search for an existent user
    Given the following users:
      | Name     | Gender | Email              |
      | Fulano   | Male   | fulano@email.com   |
      | Ciclana  | Female | ciclana@email.com  |
      | Beltrano | Male   | beltrano@email.com |
    And I see the users list
    When I search for "cic"
    Then I should see the following user:
      | Name    | Gender | Email             |
      | Ciclana | Female | ciclana@email.com |
