# ROR Short URL Generator

> RoR application that generates short urls for easy sharing. 

### Setup

> Install Ruby 2.5.3 with your prefered version manager

```shell
bundle install

rake db:create
rake db:migrate

bundle exec sidekiq

rails s 
```

## How does it generates the code?

It generates a unique 6 digits alphanumeric code taking 
samples from array that contains all digits, and all 
downcase and upcase letters. Then when the user searches 
for this code is redirected to the original url. 
