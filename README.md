# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* instalar ruby
* instalar node
* instalar rails - gem install rails
* instalar mysql - gem install mysql2 (gem install mysql2 --platform=ruby -- '--with-mysql-lib="C:\mysql-connector\lib" --with-mysql-include="C:\mysql-connector\include" --with-mysql-dir="C:\mysql-connector"')
* configurar el archivo Gemfile al uso de mysql2 como database
* configurar el archivo database.yml al uso de mysql2 (user = "root", password = "")
* se crea la db 'panditadb' en mysql
* para la autenticación con token se siguió el tutorial de la siguiente web : https://betterprogramming.pub/knock-as-an-authentication-solution-for-rails-api-acfaef5b25
* el tutorial menciona agregar configuración en 'cors.rb', en lugar de agregarlas ahí, se agrego en 'application.rb' como se indica aquí: https://admatbandara.medium.com/setting-up-cors-to-my-rails-api-a6184e461a0f