# Rick And Morty

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Rick and Morty es una aplicación que muestra los personajes de la popular serie con el mismo nombre. Hace uso de una API pública para mostrar a los personajes.

Created using [Very Good CLI][very_good_cli_link] 🤖  

Apis used:
[Rick And Morty API][https://rickandmortyapi.com/]
---

## Funcionalidades ✨
- Listar los personajes de Rick and Morty
- Buscar personajes
- Añadir favoritos

---

## Iniciando 🚀

Asegurate tener la versión 3.27.X Instalada. La puedes verificar con el comando:  
```sh
flutter --version
```

El proyecto tiene 3 flavors:

- development
- staging
- production

Para ejecutar el flavor deseado, utilice el launcher en VSCode/Android Studio o utilice los siguientes comandos:
```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Rick And Morty funciona en iOS y Android._

---

## Detalles técnicos 🚀

### Arquitectura
Se utilizó Clean architecture con un enfoque Layer-first debido al tamaño del proyecto. Dentro de /lib encontraremos 3 carpetas principales:
- data: Se encarga de obtener los datos desde datasources locales y remotos. Solo usa Dart
- domain: Contiene las entidades y los contratos que necesita el proyecto. Solo usa Dart
- presentation: contiene las vistas y la gestión de estados. Hecha con Flutter

Como gestor de estados se uso bloc con cubit. Para features más robustos se recomienda implementarlos con bloc. Cada bloc/cubit debe mantener el menor scope posible
Se hizo uso de inyección que están definidas en el archivo injection_container.dart


## Mejoras por hacer🚀
Algunas mejoras que se pueden hacer al proyecto son las siguientes:
- Añadir rutas nombradas: Podemos usar go_router para esta tarea.
- Escuchar los cambios de red: Agregar un listener de cambios de red y que la app reaccione a esto mostrando mensajes y reintentando las llamadas a la API.
- Testing: Hacer pruebas unitarias y de integración.
- Mejorar diseño: Agregar un sistema de diseño para hacer la app más consistente y fácil de trabajar
- Internacionalización: Hace falta cambiar los textos y un módulo para cambiar de idioma manualmente

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli




## Contact ✉️
Para cualquier consulta o comentario, póngase en contacto conmigo en esalvador032@gmail.com
