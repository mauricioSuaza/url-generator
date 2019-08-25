Feature: user can shorten an url
  As a university teacher
  So that I can quickly share links with my students
  I want to shorten an url 

Scenario: shorten url when url given
  Given that i am on the UrlGenerator homepage
  Then i should see "Enter url to shorten"
  When i fill in "url" with "My link to shorten"
  And  i press "Shorten Url"
  Then i should be on the ShowUrl page
  And  i should see "MyShortenedUrl"


 

