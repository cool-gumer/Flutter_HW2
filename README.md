# Chuck Norris jokes

A new Flutter project according to [F22] Cross-platform Mobile Development with Flutter course. Assignment 2 

## Getting Started
getting data and working with the site of jokes : https://api.chucknorris.io/

### Functionality 
  1. Corrections from the first A1.
  2. App works for Android
  3. App is stable — no crashes or broken behaviour
  4. Custom app icon
  5. Joke can be saved to Favourites
  6. Separate screen for Favourites
  7. Persisting of favourite jokes
  8. Missing network situation is handled


### Project Structure 

  UI files separated from logic files so in ../lib you can find:
  -lib:
    -models: (contain files with class JokeModel with this object, work is carried out according to the data read using json_serializable)
    -repositories (store logic files)
    -screens (Home page with functionality and second page for liked jokes with their ID )
    main.dart 

### Results
  .apk installer available and tested
  The case of no Internet is handled in the simplest way: By creating an "empty" instance and a Connection Error message
  every 5 jokes, a window with the percentage of liked jokes will be displayed for the user
