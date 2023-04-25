<a name="readme-top"></a>

<div align="center">
  <img src="./app/assets/images/logo.svg" alt="logo" width="140"  height="auto" />
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🔭 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 🎯 SnapPay <a name="about-project"></a>

The SnapPay, a Microverse Ruby on Rails capstone TDD project allows you to easily track your expenses by creating a list of transactions and categorizing them. By doing so, you can effortlessly analyze your spending patterns and gain valuable insights into where your money is going. SnapPay is designed with a sleek and user-friendly interface that can be accessed from your mobile device, making it a convenient tool for anyone looking to take control of their finances.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Technology</summary>
  <ul>
    <li>Ruby 3.2.2</li>
    <li>Rails 7.0.4.3</li>
    <li>PostgresSQL</li>
    <li>Tailwind CSS</li>
  </ul>
</details>

<details>
  <summary>Tools</summary>
  <ul>
    <li>VS Code</li>
    <li>GIT</li>
    <li>GITHUB</li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

Main functionalities which the app will have:

- Splash screen with links to sign up and log in pages
- Sign up page where users can register with their full name, email, and password
- Log in page where users can sign in using their email and password
- Home page (categories page) displaying a list of categories with their name, icon, and total amount of transactions
- Transactions page displaying a list of transactions ordered by most recent, with the total amount for the category at the top
- Option to add a new transaction for the selected category
- "Add a new category" page with a form for creating a new category, including name and icon fields
- "Add a new transaction" page with a form for creating a new transaction, including name, amount, and categories fields.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

<!-- - [Live Demo Link]() -->

Sorry, Currently no active link available.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running follow these simple example steps.

### Prerequisites

you have to those tools in your local machine.

- [ ] Ruby (3.2.0)
- [ ] Rails (7.0.4)
- [ ] PostgresSQL
- [ ] GIT & GITHUB
- [ ] Any Code Editor (VS Code, Brackets, etc)

### Clone Repo

Clone the project using the following bash command in an appropriate location.

```bash
  git clone git@github.com:shahadat3669/snap-pay.git
```

Go to the project directory.

```bash
  cd snap-pay
```

### Adding credentials

Rails stores secrets in `config/credentials.yml.enc`, which is encrypted and hence cannot be edited directly. Rails uses `config/master.key`. If you have the master key, to add or change credentials in your terminal, run this command (change the name of you editor if you need for example code for VS Code)

```bash
  EDITOR="code" rails credentials:edit
```

This command will create the credentials file if it does not exist. Additionally, this command will create config/master.key if no master key is defined.
Here pass the --wait flag to make sure the encryption happens after the edits have been saved and the editor closed.

```bash
  EDITOR="code --wait" rails credentials:edit
```

The scaffolded credentials.yml.enc looks like below:

```bash
  postgres_password: Database User Password
  smtp_user_name: SMTP User name
  smtp_password: SMTP User password
```

To learn more [check Custom Credentials](https://edgeguides.rubyonrails.org/security.html#custom-credentials) documentation.

### Add necessary packages

For installing necessary packages, run the following bash command:

```bash
  bundle install
```

### Run the server in development mode

In the project directory, you can run the project by using following bash command:

```bash
  ./bin/dev
```

And now you can visit the site with the URL http://localhost:3000

### Run the test

For testing you can run:

```bash
  bundle exec rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

### First Author:

**Shahadat Hossain**

[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://github.com/shahadat3669) [![linkedin](https://img.shields.io/badge/shahadat3669-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](www.linkedin.com/in/shahadat3669) [![twitter](https://img.shields.io/badge/@shahadat3669-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/shahadat3669)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Live demo will added soon**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## 👋 Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🔭Acknowledgments <a name="acknowledgements"></a>

- My Family.
- [Microverse](microverse.org)
- [Gregoire Vella](https://www.behance.net/gregoirevella) for [Snapscan - iOs design and branding](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding)
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **Can I use this project for personal use?**

  - Yes, you can use it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
