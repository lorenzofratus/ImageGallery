![Image Gallery](../assets/banner.png)

<br />
<p align="center">
  <h1 align="center">Image Gallery</h1>

  <p align="center">
    Project developed for the final exam of the course named <em>Information Technology for the Web</em> (Tecnologie Informatiche per il Web) held by Professor Piero Fraternali at <em>Politecnico di Milano</em>.
    <br />
    <a href="https://github.com/lorenzofratus/ImageGallery"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/lorenzofratus/ImageGallery/issues">Report Bug</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

![Home Page Screenshot](../assets/screen-1.png?raw=true)

This project has been developed as final assignment for the _Information Technology for the Web_ course held by Professor Piero Fraternali at _Politecnico di Milano_.

The objective of this project was to build a web application using Java servlets and exploting server-side rendering using Thymeleaf.

The application is a simple collection of images grouped in albums. The user is able to select one album and to browse through the list of images in order to see a full-size version and a description and, if desired, leave a comment.

The system is based on a simple MySQL database that only stores the path in which retrieve the images in the web server.

Another version of the same project has been developed as _Rich Internet Application_ and can be found at this [link](https://github.com/lorenzofratus/ImageGalleryRIA).

### Built With

* [Java](https://www.java.com/)
* [Thymeleaf](https://www.thymeleaf.org/)
* [MySQL](https://www.mysql.com/)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is a simple guide, provided by Professor Piero Fraternali, to prepare the environment in which the application will run.

<div align="center">

  [![Download PDF](https://img.shields.io/badge/Download-PDF-black.svg?style=for-the-badge&colorB=555)](https://raw.githubusercontent.com/lorenzofratus/ImageGallery/assets/installation-guide.pdf)

</div>

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/lorenzofratus/ImageGallery.git
   ```
2. Create a new scheme named `db_image_gallery` into MySQLWorkbench
   
3. Dump the file `ImageGallery.sql` into the newly created scheme to populate it
   
4. Import the project in Eclipse
   * Go to `File` > `Open Projects from File Systems...`
   * Click on the button `Directory...` and select the main folder of the repo
   * Click on the button `Finish`

5. Link the database to the project
   * Navigate the project tree in `WebContent` > `WEB-INF`
   * Open `web.xml`
   * Search the following terms and replace them with the correct parameters (from MySQLWorkbench): `DB_PORT`, `DB_USER`, `DB_PASSWORD`

6. Run the project
   * Right click on the project name in the Eclipse tree
   * Select `Run As` > `1 Run on Server`
   * Click on the button `Finish`

7. The application can by found at the address `localhost:8080/ImageGallery`


<!-- USAGE EXAMPLES -->
## Usage

<div align="center">
  <img src="../assets/screen-1.png?raw=true" width="30%"/>
  <img src="../assets/screen-2.png?raw=true" width="30%"/>
  <img src="../assets/screen-3.png?raw=true" width="30%"/>
  <img src="../assets/screen-4.png?raw=true" width="30%"/>
  <img src="../assets/screen-5.png?raw=true" width="30%"/>
  <img src="../assets/screen-6.png?raw=true" width="30%"/>
</div>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

<div align="center">

  [![Website](https://img.shields.io/badge/-Website-black.svg?style=for-the-badge&logo=html5&colorB=555)](https://www.lorenzofratus.it/)
  [![Email](https://img.shields.io/badge/-Email-black.svg?style=for-the-badge&logo=gmail&colorB=555)](mailto:info@lorenzofratus.it)
  [![LinkedIn](https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555)](https://www.linkedin.com/in/lorenzo-fratus/)


Project Link: [https://github.com/lorenzofratus/ImageGallery](https://github.com/lorenzofratus/ImageGallery)

</div>