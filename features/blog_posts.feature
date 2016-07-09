Feature: Blog posts
  Scenario: Blogger creates blog_post
     Given I am signed in as a blogger
     When I visit "blog_posts/new"
     And I fill in "
