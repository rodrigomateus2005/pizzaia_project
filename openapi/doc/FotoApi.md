# openapi.api.FotoApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiFotoCheckOnlineGet**](FotoApi.md#apiFotoCheckOnlineGet) | **get** /api/Foto/CheckOnline | 
[**apiFotoGet**](FotoApi.md#apiFotoGet) | **get** /api/Foto | 
[**apiFotoPost**](FotoApi.md#apiFotoPost) | **post** /api/Foto | 
[**apiFotoUuidDelete**](FotoApi.md#apiFotoUuidDelete) | **delete** /api/Foto/{uuid} | 
[**apiFotoUuidGet**](FotoApi.md#apiFotoUuidGet) | **get** /api/Foto/{uuid} | 
[**apiFotoUuidPut**](FotoApi.md#apiFotoUuidPut) | **put** /api/Foto/{uuid} | 


# **apiFotoCheckOnlineGet**
> bool apiFotoCheckOnlineGet()



### Example 
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

### Parameters
This endpoint does not need any parameter.

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFotoGet**
> List<Foto> apiFotoGet()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FotoApi();

try { 
    var result = api_instance.apiFotoGet();
    print(result);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Foto>**](Foto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFotoPost**
> apiFotoPost(uuid, favorita, contentType, contentDisposition, length, name, fileName)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FotoApi();
var uuid = uuid_example; // String | 
var favorita = true; // bool | 
var contentType = contentType_example; // String | 
var contentDisposition = contentDisposition_example; // String | 
var length = 789; // int | 
var name = name_example; // String | 
var fileName = fileName_example; // String | 

try { 
    api_instance.apiFotoPost(uuid, favorita, contentType, contentDisposition, length, name, fileName);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | [optional] [default to null]
 **favorita** | **bool**|  | [optional] [default to null]
 **contentType** | **String**|  | [optional] [default to null]
 **contentDisposition** | **String**|  | [optional] [default to null]
 **length** | **int**|  | [optional] [default to null]
 **name** | **String**|  | [optional] [default to null]
 **fileName** | **String**|  | [optional] [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFotoUuidDelete**
> apiFotoUuidDelete(uuid)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FotoApi();
var uuid = uuid_example; // String | 

try { 
    api_instance.apiFotoUuidDelete(uuid);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoUuidDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFotoUuidGet**
> String apiFotoUuidGet(uuid)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FotoApi();
var uuid = uuid_example; // String | 

try { 
    var result = api_instance.apiFotoUuidGet(uuid);
    print(result);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoUuidGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | [default to null]

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFotoUuidPut**
> apiFotoUuidPut(uuid, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FotoApi();
var uuid = uuid_example; // String | 
var body = new bool(); // bool | 

try { 
    api_instance.apiFotoUuidPut(uuid, body);
} catch (e) {
    print("Exception when calling FotoApi->apiFotoUuidPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | [default to null]
 **body** | **bool**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

