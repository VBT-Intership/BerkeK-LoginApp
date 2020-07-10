# Flutter Login App - Backend
This repository contains a login app backend written in nodejs. I used a mongodb for database solution. Also, I used express framework for this app.

## How To Install ?
- 1-) Download this repository to your machine.
```bash
git clone https://github.com/VBT-Intership/BerkeK-LoginApp.git
```
- 2-) Open Project Folder and download packages
```bash
npm install
```
- 3-) Start project
```bash
npm start
```

### Routes
Route| Http Verb | Post Body | Description
:--- | :---: | :---: | :---:
/user | `GET` | Empty | Get all users
/user | `POST` | username,password | Add a new user
/user/login | `POST` | username,password | Login operation