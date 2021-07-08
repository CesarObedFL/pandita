# README

* -------------- DOCUMENTACIÓN ---------------------

* -------------- INSTALACIÓN & CONFIGURACIÓN -------
* instalar ruby
* instalar node
* instalar rails - gem install rails (desde la consola de node)
* instalar mysql - gem install mysql2 (gem install mysql2 --platform=ruby -- '--with-mysql-lib="C:\mysql-connector\lib" --with-mysql-include="C:\mysql-connector\include" --with-mysql-dir="C:\mysql-connector"')
* configurar el archivo Gemfile al uso de mysql2 como database
* configurar el archivo database.yml al uso de mysql2 (user = "root", password = "")
* se crea la db 'panditadb' en mysql
* para la autenticación con token se siguió el tutorial de la siguiente web : https://betterprogramming.pub/knock-as-an-authentication-solution-for-rails-api-acfaef5b25
* el tutorial menciona agregar configuración en 'cors.rb', en lugar de agregarlas ahí, se agrego en 'application.rb' como se indica aquí: https://admatbandara.medium.com/setting-up-cors-to-my-rails-api-a6184e461a0f

* una vez terminada la instalación y configuración inicial, se sugiere hacer uso del comando rails db:seed para ingresar algunos datos de prueba:
*   se crean 6 usuarios predeterminados, el usuario por defecto tiene los siguientes datos:
            accountNumber: 1001, 
            name: 'cesar', 
            email: 'cesar@test.com', 
            password: 'secret', 
            age: 29, 
            phone: 3324533298, 
            balance: 0
* todas las pruebas se hicieron en el localhost usando el pueto por defecto (3000) http://localhost:3000 usando objetos tipo json con el cliente http insomnia

* -------------- USO DE LOS ENDPOINTS -----------------
* el sistema requiere autenticación, la ruta para autenticarse es localhost:3000/auth/signin , usamos una petición POST con los siguientes datos json...
    {
        "auth" : {
            "email" : "cesar@test.com",
            "password" : "secret"
        }
    }
esto nos dará el token necesario para realizar las acciones dentro de la API

* para el registro de usuarios no es necesario autenticarse, se usa la ruta localhost:3000/auth/signup usando una petición POST, por ejemplo:
    {
	    "name" : "obed",
	    "email" : "obed@test.com",
	    "password" : "test",
	    "password_confirmation" : "test",
	    "age" : 20,
	    "phone" : 3324533298
    }

* las acciones que se pueden realizar sobre los usuarios son: [:index, :show, :create, :update, :destroy] se necesita estar autenticado e incluir el token obtenido para llevarlas a cabo...

    * index lista todos los usuarios registrados, su ruta es localhost:3000/api/v1/users usando una petición GET
    * show lista un usuario especifico usando su id, la ruta es localhost:3000/api/v1/users/id con petición GET
    * create crea un nuevo usuario, la ruta es localhost:3000/api/v1/users con petición POST
    * update actualiza el usuario especificado por un id, la ruta es localhost:3000/api/v1/users/id con una petición PUT/PATCH
    * destroy elimina un usuario especificado por id, la ruta es localhost:3000/api/v1/users/id con una petición tipo DELETE

* las acciones que se pueden realizar sobre los movimientos son: [:index, :show, :create] se necesita estar autenticado e incluir el token obtenido para llevarlas a cabo...

    * index lista todos los movimientos hechos por todos los usuarios, su ruta es localhost:3000/api/v1/movements usando una petición GET
    * show lista los movimientos hechos por un usuario especifico usando el id del usuario, la ruta es localhost:3000/api/v1/movements/id con petición GET
    * create crea un nuevo movimiento, la ruta es localhost:3000/api/v1/movements con petición POST
        por ejemplo: 
            {
	            "user_id" : 1,
	            "operation" : "deposit",
	            "destinationAccount" : "",
	            "amount" : 120
            }
        en donde: 
            user_id = es el id del usuario que esta realizando la operación
            operación = es el tipo de operación que se esta realizando, hay tres tipos: [transfer, deposit, withdrawal], transferencias, depósitos y retiros...
            destinationAccount = es la cuenta destino a la que se le realiza una transferencia, por lo que será necesario solo en caso de que se haga ese tipo de operación, en caso de depósitos o retiros será nulo...
            amount = es la cantidad por la que se esta haciendo la operación