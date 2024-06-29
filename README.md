# RecyThing Mobile App

<img src= "https://github.com/RECYTHNG/flutter_recything/blob/development/recything_application/assets/images/thumbnail.svg" >

RecyThing is here as a solution aimed at addressing waste management issues in Indonesia. RecyThing offers a reporting feature that allows users to report the condition of waste around them, as well as recycling missions that award points and rewards as a form of appreciation for their contributions to environmental preservation.

**This project was developed by Group 2 as part of the Capstone Project for MSIB Alterra Academy Batch 6.**

## Features

#### 💳 Join Membership
Are you new to the RecyThing app? Don’t worry, you can register and log in again to access all features and benefits of RecyThing.
#### 📝 Insert User Detail
Edit your personal information such as profile photo, name, gender, date of birth, email, and address.
#### 🚯 Reporting Littering
Report littering in your surrounding environment.
#### 🗑️ Reporting Rubbish
Report garbage accumulation in your surroundings.
#### 💡 Doing Task
Take on a mission, complete each step, upload evidence, and earn points!
#### 🔎 Search How To Recycling Trash
Provides a search function to find content, including articles and videos, that you need.
#### 👩‍💼 Customer Service
Provides various information that users might ask about RecyThing and waste management actions.
#### 🏢 About Us
Contains information about RecyThing as a company and its internal members.
#### 🎥 Video Content
Offers informative videos about the environment integrated with YouTube.
#### 💬 Remin AI
Utilizes AI to help answer your questions about RecyThing.
#### 🥇 Achievement
Contains information on the benefits earned from each badge and the points needed to obtain them.
#### ⌛ History Point
Contains information on the point history obtained through completing challenges.
#### 📰 Article
Provides you with articles about the environment to expand your knowledge.

## List of Library

| Library                             | Link                                                   |
|-------------------------------------|--------------------------------------------------------|
| flutter_svg                         | [flutter_svg](https://pub.dev/packages/flutter_svg) |
| shared_preferences                  | [shared_preferences](https://pub.dev/packages/shared_preferences) |
| awesome_snackbar_content            | [awesome_snackbar_content](https://pub.dev/packages/awesome_snackbar_content) |
| google_maps_flutter                 | [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) |
| geolocator                          | [geolocator](https://pub.dev/packages/geolocator) |
| lottie                              | [lottie](https://pub.dev/packages/lottie) |
| carousel_slider                     | [carousel_slider](https://pub.dev/packages/carousel_slider) |
| dots_indicator                      | [dots_indicator](https://pub.dev/packages/dots_indicator) |
| smooth_page_indicator               | [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) |
| intl                                | [intl](https://pub.dev/packages/intl) |
| dash_chat_2                         | [dash_chat_2](https://pub.dev/packages/dash_chat_2) |
| substring_highlight                 | [substring_highlight](https://pub.dev/packages/substring_highlight) |
| dio                                 | [dio](https://pub.dev/packages/dio) |
| get                                 | [get](https://pub.dev/packages/get) |
| geocoding                           | [geocoding](https://pub.dev/packages/geocoding) |
| envied                              | [envied](https://pub.dev/packages/envied) |
| flutter_html                        | [flutter_html](https://pub.dev/packages/flutter_html) |
| cached_network_image                | [cached_network_image](https://pub.dev/packages/cached_network_image) |
| flutter_carousel_widget             | [flutter_carousel_widget](https://pub.dev/packages/flutter_carousel_widget) |
| carousel_indicator_simple           | [carousel_indicator_simple](https://pub.dev/packages/carousel_indicator_simple) |
| timeago                             | [timeago](https://pub.dev/packages/timeago) |
| image_picker                        | [image_picker](https://pub.dev/packages/image_picker) |
| http_parser                         | [http_parser](https://pub.dev/packages/http_parser) |

## Getting Started

1. Run the following command:
   ```bash
   # Clone this repo
   git clone https://github.com/RECYTHNG/flutter_recything.git

   # Install all dependencies
   flutter pub get
   ```
2. Next, create a `.env` file in the root of the project with the following template:
   ```
    RECYTHING_BASE_URL=<recything_base_url>
    MAPS_API_KEY=<maps_api_key>
    PLACES_BASE_URL=<places_base_url>
    TNC_BASE_URL=<tnc_base_url>
   ```
3. Due to the sensitivity of the API key, please contact the developer directly to obtain the API key and base URL.
4. Once you have obtained the base URL and API key, you can run this project with command `flutter run`.
