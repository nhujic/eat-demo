### Automation environment setup

##### Homebrew:

Make sure you have homebrew:
```
brew -v
```
Homebrew 3.4.0-34-g279ab47

Homebrew/homebrew-core (git revision 4d22d7a6861; last commit 2022-03-03)

Homebrew/homebrew-cask (git revision e62bce2db1; last commit 2022-03-04)


Install homebrew if you don't have it:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew -v
```

##### RVM

Make sure you have rvm:
```
rvm -v
```
rvm 1.29.9 (latest) by Michal Papis, Piotr Kuczynski, Wayne E. Seguin [https://rvm.io/]

Install rvm if you don't have it:
```
\curl -sSL https://get.rvm.io | bash
```

##### Ruby 2.4.0

Make sure you have Ruby version 2.4.0:
```
ruby -v
```
ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin20]

Install Ruby 2.4.0 and make it default if you don't have it:
```
rvm install ruby 2.4.0
rvm list
rvm use 2.4.0 --default
```

##### Bundler

Make sure you have bundler:
```
bundler -v
```
Bundler version 2.0.2

Install bundler:
```
gem install bundler
```
Install gems using bundler:

```
cd $EAT_DEMO_HOME
bundle install
```

#### Chromedriver
```
brew install cask chromedriver
chromedriver --version
```
ChromeDriver 99.0.4844.51 (d537ec02474b5afe23684e7963d538896c63ac77-refs/branch-heads/4844@{#875})

### Common Issues

##### Script dependencies 

###### Chrome version
It is recommended to use Chrome versions that are marked as stable in combination with RSpec, Watir and Chromedriver. Currently, Chrome v. 99.0 is used to run test scripts. 

