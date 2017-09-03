## Instalation

First of all you need to install Ruby

#### On windows

- Go to `RubyInstaller` (site)[https://rubyinstaller.org/downloads/]
- Download `Ruby 2.3.3` version (x64 if operating system is 64-bit)
- Download `DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe` (or `DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe` if operating system is 64-bit)
- Run downloaded ruby installer (first downloaded file) (you can leave all default settings)
- Check if everything works. Open cmd (Windows + r, type cmd, press enter) and type `ruby -v`, you should see `ruby 2.3.3p222`
- Next double-click on DevKit (second downloaded file), and select where to extract (for example C://DevKit)
- Locate that folder from cmd (`cd C://DevKit`) and run `ruby dk.rb init` and `ruby dk.rb install`
- Add DevKit to `PATH` (Edit environment variables, find PATH variable and on the end add `;C://DevKit/bin`, or other path if you extracted it somewhere else)

That should be it.

#### On Linux

TODO

## Starting

### MySql

- Download and install mysql
- Start mysql server

### Project setup

#### Install `wkpdftohtml` (Windows)

In order for pdf certificate (for donors) you have to install `wkpdftohtml` ([download link](https://wkhtmltopdf.org/downloads.html)) into `C://wkhtmltopdf`. If you change location, you have to chnage `config/initializers/wicked_pdf.rb` file (`exe_path` variable)

#### Configuraiton setup

Go to `/config/settings.yml`, and change value to your Google Developer API key [link](https://developers.google.com/maps/documentation/javascript/get-api-key)

Next go to `/config/database.yml` and change `username` and `password` field to match your mysql user (you can use root user in development)

#### Install required libraries and create database

Navigate to project base folder in terminal (cmd on windows) and execute
```bash
bundle install --path vendor/bundle
bundle exec rake db:create db:migrate db:seed
```

### Start application

```bash
bundle exec rails s
```