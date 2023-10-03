# Marvel-SwiftUI-Project

## Introduction
Bootcamp project involving MVVM architecture, SwiftUI, Combine, API connections, and testing to multiple platforms (iOS, Mac, etc.).

## Features

The application fetches API data and presents a main list of Marvel superheroes and a detailed screen once tapped. The application will consist of: 
* **Main Screen**. A list of Marvel Superheroes, displaying their name and photo.
* **Detail Screen**. A detailed view, displaying numerous series in which the superheroe appeared.

## Prerequisites:

* xCode 14.3
* A device or simulator running iOS 16.2 or macOS 13.1.
* A free Marvel API key, obtained at https://developer.marvel.com. 

Steps to Setup the Project:

1. Clone this repository.
2. Open the project in Xcode.
3. To use this app, you will need to add an api key and a hash value. From the menu, select Product > Scheme > Edit Scheme > Run > Arguments > Environment Variables. Paste your API_KEY and HASH values here. To create the hash value, see https://md5.gromweb.com. 
5. Run this app on a device or simulator.

## Usage

When you tap on the Hero, you will see the detail showing the 
1. Series where the hero appears 
2. Photo of the series
3. Title 
4. Description

# Screenshots

|   Main Screen            |
|--------------------------|
| <img src="./screenshots/herolist.png" width="300" alt="Main Screen"> |
|--------------------------|
|   Detail Screen          |
|--------------------------|
| <img src="./screenshots/detailview.png" width="300" alt="Detail Screen"> |
|--------------------------|

<!-- 
Main Screen
![App Screenshot](./screenshots/herolist.png)

Detail Screen
![App Screenshot](./screenshots/detailview.png)
-->
