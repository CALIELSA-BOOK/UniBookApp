# UniBookApp

UniBokkApp is an app where a user can sell and buy second hand course literature. A user logs in using Facebook and can then browse popular titles ans latest views. They can also search among ads and create their on ads.
An add contains title, ISBN, price, condition and images of the book, which the user can upload from it's cameraroll. 

UniBookApp is an iOS app built in SwitftUI. 

## Running the app

As of now the app is not deployed. You will therefore have to run it using xcode. 

## Api:s and database used

### Facebook Api

Used for authentication and profile parameters, such as name, id, email and profiel picture. 

### Google Books Api

Used to fetch books based on their ISBN when creating an ad.

### Firebase

The database used. Stores ads and users (id and the user's ads).


--------------------------------------------------------------

Do we want to have this?
## File structure

* [UniBookApp/UniBookAppApp](./UniBookApp/UniBookAppApp)
  * [UniBookAppApp.swift](./UniBookApp/UniBookAppApp/UniBookAppApp.swift)
  Main swift file.
  * [Views](./UniBookApp/UniBookAppApp/Views)

