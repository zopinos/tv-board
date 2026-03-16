# tv_program_manager

A Flutter project to manage TV shows for the course [Device-Agnostic Design with Flutter and Dart](https://opencs.aalto.fi/en/courses/device-agnostic-design).

The TV show manager can be accessed on the web here: https://zopinos.github.io/tv-board/

The TV show manager is used to create a collection of television shows to easily recall the air times of TV shows most interesting to the user. The application can also be used to view how much will the user use for TV show consumption.

## Features

- Add TV shows to a list, which is automatically saved locally and stays between visits
- View the list of TV shows, sorted in chronological order
- View analytics of added TV shows
- Quickly view the next TV show airing from the home page
- Update TV show information

## Instructions

With the navigation bar you can navigate to three main pages: home, TV shows, and analytics. After adding TV shows to the application, the home page will show you the next TV show airing.

To add TV shows to the application navigate to the TV shows page with the navigation bar. On the TV shows page you can add TV shows by tapping on the "Add TV show" button. This will lead you to a page with a form you can use to input the needed information for a TV show. To save a TV show to the list of TV shows tap the "Add TV show" button.

To view analytics of TV shows added to the application you can navigate to the analytics page.

To locally run the project use these at the root

```
flutter pub get     # install dependencies
```

```
flutter run         # start the app
```
