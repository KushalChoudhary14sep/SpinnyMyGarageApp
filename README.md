# SpinnyMyGarageApp
Demo application to add cars in garage.

#Installation process

1. Copy HTTPS link under "Code" drop down.
2. Open terminal
3. Change prefered directory to clone the project
4. Use command - git clone "HTTPS link copied from github account"
5. Change directory to the cloned project
6. Use command - pod install
7. Open Workspace

#Tools used

1. Xcode IDE - Used to develop the application
2. Storyboard in Xcode - To develop User Inteface of the Application.
3. GIT - Used for source code management.
4. Cocoapods - Dependency manager used for integrating third party libraries.
5. Simulator - Build and run the application.
6. Instruments - Used to analyse any memory leaks.
7. Realm Database - Used to store data of users and cars locally. Realm is used in this application because Realm uses an object-oriented model. Objects in code do not need to undergo any transformation before being written to the database and is faster as compared to other databases.

# Architecture

This project follows a new architecture proposed by me which has a layer on top of MVVM architecture. It has a separate controller apart from View model and View controller named as UI controller for handling UI operations which makes code supper loosely coupled.

# Project Contents

## 1. ApplicationMains - Appdelegate, launchscreen, assets
I. Appdelegate - Root object of App and manages App's shared behaviour.
II. Launchscreen - Not used as default page when the application is launched is Login screen when the user is not loggedIn in the application.
III. Assets - Used for managing image asset. We can also create one more asset file to manage color asset.

## 2. Helper

  I. Appconsntant - A structure with static variables to store hardcoded strings used throughout the application.

## 3. Networking 
Third Party Library "Moya" a wrapper to URLSession and Alomafire used to trigger Network calls in the application. URL session is not used in this application because I wanted to demonstrate the using of Moya as it gives the ability to the developer to write structured code.

  I. API Provider -

  a. CarsAPI - Contains API components such as base URL, path, method, data, task and headers defined for car make and car model.

  II. RestManager -

  a. CarRestManager - Singleton class used to call cars API to fetch car make and model.

## 4. Model 

  I. User - Class for user containing username, password and car list associated with a user. This class inherits Object class of Realm to manage properties in database instead of directly using the Object class.

  II. Car - Car model, CarMakeResponse, CarModelResponse

  a. Car model - Class for car containing car make, model and image. This class inherits Object class of Realm to manage properties in database instead of directly using the Object class.

  b. CarMakeResponse - Response model for mapping of json fetched from API to Codable.

  c. CarModelResponse - Response model for mapping of json fetched from API to Codable.

## 5. Managers

  I. Realm manager - Singleton class containing methods to interact with realm. Methods include save and delete objects to and from database respectively.

  II. User manager - Singleton class containing methods to interact with realm and variables to store current user, and store username in User defaults which is to be used for maintaing login state of the application. Methods include save and get user objects to and from database respectively.

  III. Car manager - Singleton class containing methods to interact with realm. Methods include save, delete and get car objects to and from database respectively.

## 6. View - View has all the controllers, custom views and storyboard.

  I. Custom Views -

  a. UIButton - Custom UIButton class created and used in the application which has same design. Example logout, add car image and delete button with corner radius.

  b. UITextField - Custom UITextField class created to provide padding and right view and to be used within the application.

  c. TableViewCell Xib - Custom table view cell xib used to create custom cell for list of cars to te shown in dashboard. Creating XIB gives flexibility on creating separate UI for cell and to be used within tableview. 

  II. Controllers

  a. Login

  - LoginViewController - Class inherited from UIViewController and manage the view hirearchy.
  
  - LoginUIController - Class for managing UI operation of Login screen.

  - LoginViewModel - Class used for performing database related actions.

  b. Signup

  - SignupViewController - Class inherited from UIViewController and manage the view hirearchy.

  - SignupUIController - Class for managing UI operation of Signup screen.

  - SignupViewModel - Class used for performing database related actions.

  c. Dashboard

  - DashboardViewController - Class inherited from UIViewController and manage the view hirearchy.

  - DashboardUIController - Class for managing UI operation of Dashboard screen.

  - DashboardViewModel - Class used for performing database related actions.

  III. Storyboard - Storyboard used to create User Interface of the Login, Signup and Dashboard screen.

## 7. Extension 

  a. UIViewcontroller - Used to create functions used in UIviewController for entire project such as show tost message, show alert, etc,. 

  b. UIApplication - Used to resolve window warning for iOS 15 deployment target.

  c. Results + Realm - Used to create function of generic type which appends result of database in an array and returns the array.

## 8. PlayDemoTests - Test cases for API calls.
