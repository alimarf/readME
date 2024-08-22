# flutter-getx-clean-architecture
A flutter clean architecture with GetX

# readME

Article project with Flutter.

# Project Structure
```
.
├── assets
├── environments
├── lib
│   ├── app
│   │   ├── modules
│   │   │   ├── main
│   │   │   │   ├── presentation
│   │   │   │   │   └── splash
│   │   │   │   └── routes
│   │   │   └── shared
│   │   │       ├── presentation
│   │   │       │   ├── camera
│   │   │       │   ├── image_viewer
│   │   │       │   ├── information
│   │   │       │   └── web_viewer
│   │   │       ├── routes
│   │   │       └── utils
│   │   └── routes
│   └── core
│       ├── base
│       │   └── repository_response
│       ├── config
│       ├── exceptions
│       ├── failure
│       ├── networking
│       │   └── api_response
│       ├── services
│       ├── ui
│       │   ├── colors
│       │   ├── constants
│       │   ├── themes
│       │   ├── typography
│       │   └── widgets
│       │       ├── atoms
│       │       │   ├── align
│       │       │   ├── bottom_sheet
│       │       │   ├── breakpoint
│       │       │   ├── button
│       │       │   ├── card
│       │       │   ├── center
│       │       │   ├── check_box
│       │       │   ├── clip_rect
│       │       │   ├── column
│       │       │   ├── container
│       │       │   ├── counter
│       │       │   ├── date_picker
│       │       │   ├── dialog
│       │       │   ├── divider
│       │       │   ├── empty_error
│       │       │   ├── expanded
│       │       │   ├── gap
│       │       │   ├── gesture_detector
│       │       │   ├── html
│       │       │   ├── image
│       │       │   ├── label
│       │       │   ├── loading
│       │       │   ├── month_picker
│       │       │   ├── padding
│       │       │   ├── page_indicator
│       │       │   ├── radio_button
│       │       │   ├── radio_group
│       │       │   ├── row
│       │       │   ├── scroll_view
│       │       │   ├── select_box
│       │       │   ├── sized_box
│       │       │   ├── skeleton
│       │       │   ├── stack
│       │       │   ├── tag
│       │       │   ├── text
│       │       │   └── textfield
│       │       ├── moleculs
│       │       │   ├── m_app_bar
│       │       │   └── m_skeleton_list
│       │       └── organigrams
│       │           └── scaffold
│       ├── utils
│       │   ├── extension
│       │   ├── size
│       │   └── toast
│       └── values
│           ├── flavor
│           └── state

```
**.vscode**: contain vscode configuration to help debugging  process  
**.husky**: contain hook manager rules  
**scripts**: contain environment variables file for all of flavor  
**lib/core**: contain some config, utils, and widgets that does not have relation with app business logic  
**lib/app**: contain all files that related with business app

## Architecture
![Clean architecture](https://flutterawesome.com/content/images/2022/07/Code-2022-24-18-40.jpg)

In this project i try to implement this architecture. This project consist of three layers especially in product module. In the presentation layer we use getx pattern that consists of view, controller, and binding as widely known. This architecture will apply to the main features such as product module in this case. Other modules such as splash and shared does not have this structure because the modules only have view or presentation actually

## Dependency Injection

Programming technique to inject an object with its dependency. With this practice object creation becomes more easily, customable, and also testable. I use dependency injection in many cases in this project such use controller creation, repository creation, use case creation, and data source creation.

getx

## Repository Pattern

A programming approach to separate business logic layer and data layer. In this project we use repository pattern where the repository concatenate any data source in this case network and local data source. With this implementation, layer that call repository doesn't know  from where data was produced.


## Atomic design

An approach that is inspired by how an atom build more complex component.

```
 widgets
│   │   ├── atoms
│   │   ├── moleculs
│   │   └── organigrams
```

## Repository Pattern

A programming approach to separate business logic layer and data layer. In this project we use repository pattern where the repository concatenate any data source in this case network and local data source. With this implementation, layer that call repository doesn't know  from where data was produced.

## Caching

Caching make application faster, more efficient, and at some cases can help reduce backend side load. There are many layers that we can use as caching implementation place from database level, backend level, even in mobile apps. In this project i use caching for storing api response, image, and also in networking.  

**hive**: store cache data  
**cached_network_image**: display and manage image cache  
**dio_cache_interceptor**: manage network cache  
**dio_cache_interceptor_hive_store**: store network cache

## Security

Security becomes crucial aspect nowdays since security issues could lead us to the big problem such as data leak. In this project i encrypt all data cache so its reduce the possibility of data leak. Not only that, i implement obfuscation in build process as well.

**encrypt**: encrypt and decrypt cache data 

## Logging

Logging helps developer understand how is application running in development environment.

**pretty_dio_logger**: log request and response  
**curl_logger_dio_interceptor**: generate curl of each request to help reproduce issue in api  

## Code generation

Code generation increase efficiency of development process and reduce the number of mistakes.

**json_annotation**: generate model  
**freezed_annotation**: generate model with useful extension  
**retrofit**: generate network logic  


## Flavor

Flavor lets me create multiple variants with one single codebase. For me personally i use this feature to ensure the generated apk/bundle use the correct environment.

## Error handling

Good error handling is important aspect that we have to our project. In this project i use multiple exception and create toast and empty error widget to display error message.

## Responsive

Responsiveness makes our app show appropriate in any platforms.

**sizer**: help responsiveness with sp, h, w extension to number

## Network

For network purpose we have to add api client and in this project i prefer to choose dio as my api client. Dio is powerful api client because dio has many configurations so this library give us much flexibility to us such as logging and caching.

**dio**: powerful api client  

## Environment

Inject environment variables from other files is more beneficial in some cases such as in CI/CD scenario we can inject certain environment inside our pipeline.

**flutter_dotenv**

## Functional programming

Functional programming bring many good practical. We use the example of them in the use case layer. We use them of that features such us either to give clearly data returned by repository.

**dartz**: brings functional programming implementation