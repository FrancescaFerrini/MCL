# **Flamindo**

Flamindo is an application dedicated to user introspection through music, facilitating the connection between music and journaling. Our inspiration comes from the booklets used by artists to delve deeply into their albums, providing details about the songs, the album's writing context, and the decisions made. We aim to offer this same experience to our users: the ability to create their own booklet about significant events or periods. Each user can personalize their experience by choosing a cover, entering a title, date, and location, and describing the album's meaning while selecting songs that best resonate with their memories. Users can also reflect on the entire album or individual songs. The application supports personal expression or provides guidance through introspective questions.

## *Screenshots*

<div align="center">
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/5f350eb7-ddaf-4db6-9b46-063b925386c4" width="300" />
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/4d9ab3ae-a5bb-4a36-a2d7-6563dd809af6" width="300" />
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/1bdbc74a-14a3-46cf-87c7-b1dddd45fdbc" width="300" />
</div>

<div align="center">
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/2c84db72-1aa3-4ebb-bbdc-0d5bd247d266" width="300" />
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/fb026595-1593-4714-bdf1-b7783a1c5331" width="300" />
  <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/a1df6f7d-deaf-4702-9960-70d93bc41c62" width="300" />
</div>

<div align="center">
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/5517c950-0b43-4f6b-9fee-5fa745ae0a67" width="300" />
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/c75aa424-1669-4885-82a2-44c96dc00000" width="300" />
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/f8118ccf-dd9a-4f06-87bd-eee4ca26a160" width="300" />
</div>

<div align="center">
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/c9d10379-2965-4953-b9df-7a09e49fadb5" width="300" />
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/d09e6069-6e24-483c-b094-6737450a2e46" width="300" />
   <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/9710644d-011b-402b-a890-faa9c92fa69c" width="300" />
</div>

<div align="center">
 <img src="https://github.com/FrancescaFerrini/MCL/assets/75753679/504598c0-a27d-4557-b0bb-46906e12cf2a" width="300" />
</div>

## **Main Features:**

### **Album Management**
-   Create albums to organize your songs.
-   Each album can include a cover image, title, brief description, as well as other details such as date and location that help the user to dive deeper in their introspection of the significant music-related moments.

### **Song Management**
-   Add songs from a catalog by specifying the name or artist.
-   Annotate each song with personal reflections, memories, or interpretations.

### **Dynamic User Interface**
-   Use image processing techniques to extract dominant colors from album and song covers. Which enhance the app's visual aesthetics in order to customize the user interface.

### **Integration with Apple Music API**
-   Use the Apple Music API to integrate search and data loading features.
-   Allow users to search for songs, artists, and albums directly from the app.

## **Frameworks:**

-   **SwiftUI**: Declarative framework for creating user interfaces across all Apple platforms. Utilizes flexible layout systems, reactive view states, and environments to manage application state.
-   **Core Data**: Apple's framework for managing model layer objects. Used for data persistence, leveraging relationships and fetch requests for efficient and scalable data management.
-   **Combine**: Apple's framework for managing asynchronous events and data flow. Coordinates data between the SwiftUI user interface and the Core Data model layer, using publishers and operators to transform, combine, and filter data in real-time.
-   **Foundation**: Apple's core framework for managing data, files, networking, and more. Used for fundamental operations such as date handling, data serialization, and string management.
-   **PhotosUI**: Integrates access and management of images from the photo library, allowing users to select custom images for album covers.
-   **CoreLocation**: Manages geographical location, allowing you to associate locations with albums and explore music through meaningful places.
-   **MusicKit**: Uses the Apple Music API for search and data loading features, allowing access to the vast Apple Music library. Implements features to retrieve detailed information about music tracks, including titles, artists, albums, and cover images.
