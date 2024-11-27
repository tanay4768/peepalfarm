# peepalfram

A new Flutter project.

## Getting Started

### Key Descisons : 
Why this project?
The project is related to a non profit ngo which helps animals and i am very inspired from them hence i have decide to do this project.
1)	Using TextFormField instead of just TextField to perform validation at once;
2)	Error while deciding key for realtime database:
 	First I considered email as a key for realtime database but got error as firebase paths should not contains . , [. ] , etc signs.
3)	Removing Google auth as not every email will be a google email hence giving error while linking credentials.
4)	Redefining textTheme data, text theme data is redefined to fit the Ui perfectly
5)	Keeping darkMode setting to be based on the Users system as I am planning to put it inside the app.
6)	Fixing the size constraints so that ui will look nice in any layout.
7)	###To Do : 
1)	Use Getx Binding to stop all controllers executing at the same time.
2)	Using username as key to database
3)	Add a splash screen to the app

