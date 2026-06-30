# C.S 1.6 Server Finder (Web-Scrapper)
This project is about scraping a website that is listing IP addresses of game servers. The application parses network information of game servers from web documents and also does a ping test for them. After testing ping rates, the program outputs a list of game servers sorted by their Ping value in ascending order. You can get more lists by typing 'next' after each output.

![screenshot](https://github.com/8Bts/Web-Scrapper/blob/scrapper/screenshot.png)

## Built With

- Ruby 3.2.2
- Rspec 3.9
- Nokogiri 1.19.4
- HTTParty 0.18.1
- Net-Ping 2.0.8
- Colorize 0.8.1
- Bundler 2.4.10
- VS Code
- Repl.it

## Getting Started 

To get a local copy follow these simple example steps.

 - Click on **Clone or download** button of this repository and copy the URL(or you can just download .zip).
 - Open your command prompt and run this command: git clone COPIED-URL


## Prerequisites
In order to make the program work, you need to have ruby interpreter installed in your system. You can get the latest version of ruby from [official website](https://www.ruby-lang.org/en/downloads/).

## Installation
Run `bundle install` in your shell. The Gemfile pins gem versions so installs stay reproducible.

## Usage
1. Open your command prompt and navigate to 'bin' folder of application directory(use 'cd' command)
2. Type ruby main.rb
3. Type 'next' if you want to load more server information

## Automated tests

You can run rspec tests using `rpsec` or `rspec ./spec/[specfile].rb` commands

## Authors

👤 **Rashid Mammadli**

- Github: [8Bts](https://github.com/8Bts)
- Twitter: [@Rasheed49705929](https://twitter.com/Rasheed49705929)
- Linkedin: [linkedin](https://www.linkedin.com/in/mcmizze-price-238a70135/)
- Email: mcmizze@yahoo.com


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the <a href="https://github.com/8Bts/Web-Scrapper/issues" target="_blank">issues page</a>.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
 
 - [GameTracker](https://www.gametracker.com/)
- <a href="https://www.rubygems.org/" target="_blank">Ruby Gems official website</a>
- <a href="https://ruby-doc.org/core-2.6.1/" target="_blank">Ruby Docs</a>
- <a href="https://www.stackoverflow.com/" target="_blank">Stackoverflow</a>
