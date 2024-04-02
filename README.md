## Movies Application

### Prerequisites
Make sure you have the following tools installed:
- Clone `.env.example` file with 3 env (`.env` for dev, `.env-stg` for staging, `.env-prod` for production)
- Add file keystore to `{project}/android` path with 3 env (`dev.keystore` for dev, `staging.keystore` for staging, `production.keystore` for production)
- Clone `android/key.properties.example` and rename to `key.properties` (Please contact email `anhlv@bap.jp` or admin to get information in this file.)
- Run `flutter pub get` to install the dependencies
- Run `dart run build_runner build --delete-conflicting-outputs --verbose` in auto generator


### Run the app

Using Visual Studio Code:
- Press `Shift + Cmd + D` to open the debug panel, select the run mode and then click the play button to run the app
- You can change the run environment by editing the `--flavor` flag in `.vscode/launch.json` file
Using Android Studio:
- Select the run mode and then click the play button to run the app
- You can change the run environment by editing the flavor field in the run script
Using terminal:
- The app in development environment to run:
```bash
flutter run --flavor=dev
```
- The app in staging environment to run:
```bash
flutter run --flavor=staging
```
- The app in production environment to run:
```bash
flutter run --flavor=production
```


### When adding a new translated text

- Add the translated text to `lib/core/languages/translations/<langualge>.json`

- Run this script to generate the translation keys
```bash
flutter pub run easy_localization:generate \
  -f keys \
  -S lib/core/languages/translations \
  -O lib/core/languages \
  -o translation_keys.g.dart
```

### Screenshot

#### Deserialise the json and represent it in a list - Title, poster, rating.
<img alt="Deserialise the json and represent it in a list - Title, poster, rating." src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/list_movie.png" width="300"/>

#### Movie details page
<img alt="Movie details page" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/detail_movie.png" width="300"/>

#### User and Watchlist page
<img alt="User and Watchlist page" height="" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/user_and_watchlist.png" width="300"/>

#### SignIn page
<img alt="SignIn page" height="" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/signIn.png" width="300"/>

#### Signup page
<img alt="Signup page" height="" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/signup.png" width="300"/>

#### Forgot password page
<img alt="Forgot password page" height="" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/forgot_password.png" width="300"/>

#### Video demo
<img alt="Video demo" src="https://github.com/LeVanAnhBAP/MoviesApplication/blob/main/image_capture/5308893970930.mp4" width="300"/>


