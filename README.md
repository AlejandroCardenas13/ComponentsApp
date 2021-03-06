# **Flutter -  Componentes**

## Introducci贸n
La meta del proyecto es conocer y construir algunos Widgets b谩sicos que son fundamentales en una aplicaci贸n m贸vil.

## Pre requesitos 馃憖 
- Visual Studio Code 1.50.0v en adelante o Android Studio 4.0v en adelante
- Flutter SDK 1.20.1v o superior
- Configuraci贸n de variables de entorno de Android y Flutter

## Instalaci贸n 鈿? 鈿?
- Para clonar el repositorio en local, debes ejecutar el siguiente comando: ```git clone https://github.com/AlejandroCardenas13/ComponentsApp.git``` 
- Importar el proyecto en Visual Studio Code o Android Studio

## Estructura del proyecto 鈿狅笍
Cualquier proyecto de flutter tiene la siguiente estructura: 
``` 
+ exceptions
    Classes that catch exceptions and throw custom messages when automation fails due to it is not found what was expected.

+ integrations
    Classes that enable connection to services.

+ interactions
    Classes that perform low-level actions, such as change tab in browser, reload browser, among others.
    
+ models
    Classes that use the object builder pattern or related to the domain model.

+ questions
    Classes with which values are obtained and then verified in the StepDefinitions (asserts).

+ tasks
    Classes that perform high-level actions, such as login in the application, enter data into a form, etc.

+ user_interface
    Classes that map the objects and elements of user interfaces.

+ utils
    Classes that contain common functionalities.
```

