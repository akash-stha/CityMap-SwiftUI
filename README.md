# 📍 City Map App

Explore the world with a beautifully designed **City Map App** built with **SwiftUI** and the **MVVM** architecture. This app showcases popular cities and landmarks, offering detailed descriptions, stunning images, and smooth animations. It's perfect for learning or presenting modern app development concepts.  

## 🚀 Features  

- **MapKit Integration**: Displays various city locations with dynamic region updates.
- **Custom Annotations**: Unique map annotations for each location.
- **Auto-Scrolling TabView**: Automatically scrolls through images in the detail view.
- **Dynamic Design**: Adapts seamlessly to iPhone and iPad with support for landscape orientation on iPads.
- **Light/Dark Mode**: Fully supports system appearance preferences.
- **Gesture and Animations**: Enhances user interaction with tap gestures and smooth animations.
- **Location Details**: Provides detailed information, images, and links for each city.
- **List View**: Displays a list of all locations for easy navigation.

## 🛠️ Tech Stack  

- **Language**: Swift
- **Frameworks**: SwiftUI, MapKit
- **Architecture**: MVVM (Model-View-ViewModel)

## Components

### 1. **Location Data**
   - Defines the `Location` model with attributes like name, city name, coordinates, description, images, and an external link.

### 2. **ViewModel**
   - Manages app state and business logic.
   - Updates the map region, toggles the location list, and handles navigation between locations.

### 3. **Views**
   - **Main Map View**: Displays a map with annotated city locations.
   - **Location Detail View**: Provides a detailed description, images, and a map preview of the selected city.
   - **List View**: Displays a scrollable list of locations.
   - **Preview View**: Shows a card-like preview for the selected location.
   - **Custom Map Annotation**: Highlights selected locations with a unique annotation.

### 4. **Dynamic UI**
   - Leverages SwiftUI's `TabView`, `Map`, `ScrollView`, and other views for an interactive user experience.


## Setup Instructions

1. Clone the repository.
   ```bash
   git clone https://github.com/akash-stha/CityMap-SwiftUI.git
## Steps to Run the Project

1. Clone the repository or download the project files.
2. Open the project in **Xcode**.
3. Build and run the project on an **iPhone** or **iPad** simulator.

   - Make sure you have the **latest version of Xcode** installed.
   - Select the desired simulator or a physical device.
4. Explore the features of the **Map Location App**.

## 📸 Screenshots  

<p align="center">  
  <img src="https://github.com/user-attachments/assets/d529fbd8-d176-4f9f-894c-4ce6ca531061" width="300">
  <img src="https://github.com/user-attachments/assets/44bfeea6-b99d-4ccf-b0f6-f1f5fb017777" width="300">
  <img src="https://github.com/user-attachments/assets/83213794-171a-49d0-8ca1-aac839528720" width="300">
  <img src="https://github.com/user-attachments/assets/b8632ec4-d8df-4c6e-ab04-4a8bef3816ed" width="300">
  <img src="https://github.com/user-attachments/assets/c1625474-9526-41bf-969f-f603c8f60ea6" width="300">
  <img src="https://github.com/user-attachments/assets/a176811f-5d27-4d84-8321-3955c08ab68b" width="300">
</p>
