Feature: Blog posts
  Scenario: Blogger creates blog_post
     Given I am signed in as a blogger
     When I visit "/blog_posts/new"
     And I fill in "blog_post_title" with "Foo"
     And I fill in "blog_post_description" with "Bar"
     And I fill in "blog_post_content" with "A lot of text"
     And I press "Create Post"
     Then I should see "Foo"
     And I should see "Bar"
     And I should see "A lot of text"
