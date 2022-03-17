# Flutter_MVVM_APP

in this project , we implemented 2 uses cases of a covid-19 vaccination app following the Mvvm architecture style . which is a software architectural pattern that facilitates the separation of the development of the graphical user interface (the view) from the development of the business logic or back-end logic (the model) so that the view is not dependent on any specific model platform.

   the uses cases are : 
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


