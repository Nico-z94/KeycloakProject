Configuración para proyecto educativo sobre Keycloak con ZUUL y EUREKA Server:

# springboot-microservices-starter

Para la realización de este proyecto se utlizará:

	- ZUUL para Proxy/API gateway
	- EUREKA para Load balancing
	- KEYCLOACK para admiminstración y gestión de credenciales (Identity y Access Management)
	La versión de Keycloak que se necesita para este proyecto es la siguiente: https://www.keycloak.org/archive/downloads-4.8.3.html
	

- ZUUL Server (http://localhost:8762)
	-- startup - mvn install && mvn spring-boot:run
- EUREKA Server (http://localhost:8761) 
	-- startup - mvn install && mvn spring-boot:run
- KEYCLOACK Server (http://localhost:8180)
	-- startup - .\standalone.bat -Djboss.socket.binding.port-offset=100
- API (http://localhost:8080)
	-- startup - mvn install && mvn spring-boot:run
	
- Tiene la opción de actualizar o crear un reino (realm) de Keycloak usando zuul-server/config/quickstart-realm.json	
	
- Autenticación y obtención del token de la API.

	POST /auth/realms/spring-boot-quickstart/protocol/openid-connect/token HTTP/1.1
	Host: localhost
	Authorization: Basic YXBwLWF1dGh6LXJlc3Qtc3ByaW5nYm9vdDpzZWNyZXQ=
	Content-Type: application/x-www-form-urlencoded
	cache-control: no-cache
	Postman-Token: 6c331f76-0485-4f34-ac86-82df9a3485f1
	username=alicepassword=alicegrant_type=password
	
- Acceso a los microservicios usando JWT.

	GET /api/v1/resourceb HTTP/1.1
	Host: localhost
	Authorization: Bearer <JSON Web Token>
	cache-control: no-cache
	Postman-Token: 52b7a4a5-5b42-41e9-a81e-2f3007c92e9a

- Configuracíon para levantar proyectos en Docker
- Ejecutar el siguiente comando para cada microservicio en su respectivo directorio:
 	- `docker build -f Dockerfile -t {nombre_microservicio} .`

- En nuestro caso serían {nombre_microservicio}:
	-api-service
	-zuul-server
	-eureka-server

- Ejecutar el siguiente comando en la terminal utilizando docker-compose en el directorio donde se encuentra guardado el proyecto:
        - `docker-compose up` 
           
