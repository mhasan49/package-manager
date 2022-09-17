<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use...
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![docs build][docs-build]][contributors-url]
[![Repo size][repo-size]][contributors-url]
[![last commit][last-commit]][contributors-url]
[![language count][language-count]][contributors-url]
[![github build][github-build]][github-url]





<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://jhub-temple.readthedocs.io/en/latest/README.html">
    <img src="images/logo.png" alt="Logo" width="100" height="100">
  </a>

  <p align="center">
    Customized jupyterhub installation for HPC 
    <br />
    <a href="https://jhub-temple.readthedocs.io/en/latest/README.html"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://jhub-temple.readthedocs.io/en/latest/README.html">View Demo</a>
    ·
    <a href="https://jhub-temple.readthedocs.io/en/latest/README.html">Report Bug</a>
    ·
    <a href="https://jhub-temple.readthedocs.io/en/latest/README.html">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
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
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<h4 align="center">
  Infrastructure
</h4>

<div align="center">
  <img alt="Boards" width=80%" src="images/image1.png"/>
</div>

<h4 align="center">
  Software Workflow
</h4>


JupyterHub brings the power of notebooks to groups of users. It gives users access to computational environments and resources without burdening the users with installation and maintenance tasks. Users - including students, researchers, and data scientists - can get their work done in their own workspaces on shared resources which can be managed efficiently by system administrators.


We want to build JupyterHub and its core components: proxy, authenticator, spawner. This repo goes through a series of steps to customize JupyterHub beyond its defaults. The configurability of JupyterHub enables its use in a variety of deployment settings.


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
### Prerequisites

Before installing JupyterHub, you will need a Linux/Unix based system.`Python 3.6` or greater. An understanding of using `pip` or `conda` for installing Python packages is helpful.

### Installation

1. Clone the repo
   ```sh
    git clone https://github.com/mhasan49/jhub_temple.git
   ```

2. Install jupyterhub 
   ```sh
    make all
   ```
5. Once successfully installed, we can start the hub by first activating the venv
   ```sh
    source /path/to/jupyterhub/venv/bin/activate
   ```
6. Finally, to start the hub
   ```sh
    jupyterhub -f /path/to/jupyterhub_config.py
   ```  
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Add Changelog
- [x] Add back to top links
- [ ] Add Additional Templates w/ Examples
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support
    - [ ] Chinese
    - [ ] Spanish

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

<!--
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#top">back to top</a>)</p>

-->


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[docs-build]: https://img.shields.io/readthedocs/jhub_temple?style=for-the-badge

[repo-size]: https://img.shields.io/github/repo-size/mhasan49/jhub_temple?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors

[last-commit]: https://img.shields.io/github/last-commit/mhasan49/jhub_temple?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors

[language-count]: https://img.shields.io/github/languages/count/mhasan49/jhub_temple?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors

[github-build]: https://img.shields.io/github/workflow/status/mhasan49/jhub_temple/testing-debian10?style=for-the-badge
[github-url]: https://github.com/mhasan49/jhub_temple/actions/workflows/testing-debian10.yml



[product-screenshot]: images/screenshot.png

[![testing-debian10](https://github.com/mhasan49/jhub_temple/actions/workflows/testing-debian10.yml/badge.svg?branch=main)](https://github.com/mhasan49/jhub_temple/actions/workflows/testing-debian10.yml)