# Flutter_MVVM_APP

in this project we have implemented 3 use cases of a covid-19 vaccination app following the MVVM architecture style with Vue.js / Flutter. MVVM is a software architectural pattern that facilitates the separation of the development of the graphical user interface (the view) from the development of the business logic or back-end logic (the model) so that the view is not dependent on any specific model platform.

   the uses cases are : 
    - Register / Login
    - consult and update profile 
    - consult vaccins list 

## Components of MVVM pattern
  

  ![alt img](https://www.journaldev.com/wp-content/uploads/2018/04/android-mvvm-pattern.png) 

### Model 
The model represents a single source of truth that carries the real-time fetch data or database-related queries.
This layer can contain business logic, code validation, etc. This layer interacts with ViewModel for local data or for real-time. Data are given in response to ViewModel.

###  ViewModel 
ViewModel is the mediator between View and Model, which accept all the user events and request that to Model for data. Once the Model has data then it returns to ViewModel and then ViewModel notify that data to View.
ViewModel can be used by multiple views, which means a single ViewModel can provide data to more than one View.

###  View  
The view is where the user is interacting with Widgets that are shown on the screen. These user events request some actions which navigate to ViewModel, and the rest of ViewModel does the job. Once ViewModel has the required data then it updates View.


## MVVM in Vue.js
Vue.js coding style allows us to implement MVVM pattern easly. We have three main sections in each .vue file (Model / View / ViewModel).

### Model
The model layer is represented in the data section of the file. There we can define our models so we can interact with them via the ViewModel Layer

### ViewModel
The ViewModel layer is represented in the methods section of the file. There we can define the logique to manipulate the data so it can be ready to be presented properly.

### View
The View layer is represented in the template section. There we can bind our data to the view so it can be interactive. 

![alt img](https://giselamedina1.gitbooks.io/vue-js/content/assets/import1.png) 

### How to run the application
First run the server by the following commands. 

```
npm install
npm run serve
```

then run the web application
```
npm install
npm run serve
```

for the mobile application run 
```
npm install
npm run serve
```

### Screenshots
![alt img](https://i.postimg.cc/x8DKcQnt/mvvm1.png) 
![alt img](https://i.postimg.cc/Bvz5fDyW/mvvm2.png) 
![alt img](https://i.postimg.cc/ZqnPQjwF/mvvm3.png) 
![alt img](https://i.postimg.cc/V6bqfvQJ/mvvm4.png) 
![alt img](https://i.postimg.cc/htpbMN1t/mvvm5.png) 
![alt img](https://i.postimg.cc/2855hJyw/mvvm6.png) 
![alt img](https://i.postimg.cc/G3K2BrLt/mvvm7.png) 
![alt img](https://i.postimg.cc/Xqs7tKHd/mvvm8.png) 
