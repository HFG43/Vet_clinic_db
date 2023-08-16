<a name="readme-top"></a>
# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 [Vet Clinic <a name="about-project"></a>

Vet Clinic is a project where I put in practice the use of PGSQL, by generating an animals database.

**[Vet Clinic]** is a first project usign PGSQL to practice creating Tables, making queries for individual and multiple tables, and to generate a performance audit.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **[Use Gitflow]**
- **[Create a Relational dataBase using PostgreSQL]**
- **[Create a Table and insert data]**
- **[Make different SQL queries]**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

No live DEMO available

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with plain SQL that can be used to recreate a database.

### Prerequisites

In order to run this project you need to have PostgreSQL installed:

Linux:
`sudo apt-get install postgresql`

Windows: 
`https://www.postgresql.org/download/windows/`
### Setup

Clone this repository to your desired folder:

  cd my-folder
  git clone https://github.com/HFG43/Vet_clinic_db

--->

### Usage

To run the project, execute the following command:

```sh
  CREATE DATABASE vet_clinic;
```
After creating the DataBase use [schema.sql](./schema.sql) to create animals table.

```sh
CREATE TABLE table_name(
   column1 datatype,
   columnN datatype
);
```
Use [data.sql](./data.sql) to populate tables with sample data.

```sh
INSERT INTO animals VALUES (column1, ...columnN);
```

Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.

```sh
SELECT [define column(n) or use * for all] FROM animals WHERE [CONDITION];
```

To run tests, run the following command:

No tests available yet.

### Deployment

No Deployment available

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Author <a name="authors"></a>

👤 **Hernán Güemes**

- GitHub: [@githubhandle](https://github.com/HFG43)
- Twitter: [@twitterhandle](https://twitter.com/HFG_43)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/hern%C3%A1n-g%C3%BCemes-a440591b/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Make queries for multiple tables]**
- [ ] **[Add Join table for visits]**
- [ ] **[Generate a performance audit]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project you could clone the repo and work with it or do the changes in a new branch. Also you could let a message with your thoughts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for providing the necessary resources for this project.

I would like to thank...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>
