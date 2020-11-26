REM java -jar swagger-codegen-cli.jar generate -i http://localhost:5080/swagger/v1/swagger.json -l dart -o ..\tetse

java -jar openapi-generator-cli.jar generate -i http://localhost:5080/swagger/v1/swagger.json -g dart-dio -o ..\tetse