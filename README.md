# UniBookApp

UniBokApp is an app where a user can sell and buy second hand course literature. A user logs in using Facebook and can then browse popular titles ans latest views. They can also search among ads and create their on ads.
An add contains title, ISBN, price, condition and images of the book, which the user can upload from it's cameraroll. 

UniBookApp is an iOS app built in SwitftUI. 

## Running the app

As of now the app is not deployed. You will therefore have to run it using xcode. For full functionality we advice plugging in your own adivce and run the app on that. Otherwise e.g connecting to the mail app won't work. Note: some features (e.g scan) only works with iOS 15. 

Since the app is not live (no privacy policy added) only developers connected to the app can use their own personal Facebook account. 

To log in use the test user:

      Name: Test User
      mail: open_gkrgsdd_user@tfbnw.net 
      pwd: Testing123
     

## Api:s and database used

### Facebook Api

Used for authentication and profile parameters, such as name, id, email and profile picture. 

### Google Books Api

Used to fetch books based on their ISBN when creating an ad.

### Firebase

The database used. Stores ads and users (id and the user's ads).



