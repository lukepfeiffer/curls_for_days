Feature: Blog posts
  Scenario: Blogger creates blog_post
     Given I am signed in as a blogger
     When I visit "/blog_posts/new"
     And I fill in "blog_post_title" with "Foo"
     And I fill in "blog_post_description" with "Bar"
     And I fill in "blog_post_content" with "Alot of text"
     And I press "Create Post"
     Then I should see "Foo"
     And I should see "Bar"
     And I should see "Alot of text"

  Scenario: User views blog post
    Given the following user:
      | email    | email@example.com |
      | username | username          |
      | password | password          |
      | blogger  | true              |
    And that user has the following blog_post:
      | title       | Foo     |
      | subtitle    | Bar     |
      | description | desc    |
      | content     | content |
      | user_id     | 1       |
    And I am on the home page
    Then I should see "Foo"
    And I should see "Bar"
    And I should see "desc"
    And I should see "content"
