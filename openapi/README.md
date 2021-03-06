# openapi
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

Dart 1.20.0 or later OR Flutter 0.0.20 or later

## Installation & Usage

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```
name: openapi
version: 1.0.0
description: OpenAPI API client
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      version: 'any'
```

### Local
To use the package in your local drive, please include the following in pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';


var api_instance = new FotoApi();

try {
    var result = api_instance.apiFotoCheckOnlineGet();
    print(result);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoCheckOnlineGet: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*FotoApi* | [**apiFotoCheckOnlineGet**](doc\/FotoApi.md#apifotocheckonlineget) | **get** /api/Foto/CheckOnline | 
*FotoApi* | [**apiFotoGet**](doc\/FotoApi.md#apifotoget) | **get** /api/Foto | 
*FotoApi* | [**apiFotoPost**](doc\/FotoApi.md#apifotopost) | **post** /api/Foto | 
*FotoApi* | [**apiFotoUuidDelete**](doc\/FotoApi.md#apifotouuiddelete) | **delete** /api/Foto/{uuid} | 
*FotoApi* | [**apiFotoUuidGet**](doc\/FotoApi.md#apifotouuidget) | **get** /api/Foto/{uuid} | 
*FotoApi* | [**apiFotoUuidPut**](doc\/FotoApi.md#apifotouuidput) | **put** /api/Foto/{uuid} | 


## Documentation For Models

 - [Foto](doc\/Foto.md)
 - [InlineObject](doc\/InlineObject.md)


## Documentation For Authorization

 All endpoints do not require authorization.


## Author




