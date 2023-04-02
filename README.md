# fantom-contact-app
Contact App example using [Hypermedia](https://hypermedia.systems/book/introduction/) with Fantom Language

The purpose is to create a "modern" web application that use only a little of Javascript
while the server produce only hypermedia documents, not JSON.

## Installation

This application requires:

- [Fantom](https://fantom.org) language

- [Mustache](https://github.com/afrankvt/mustache) template pod

- Sqlite

### Install Fantom

Follow instructions at [official website](https://fantom.org/download)

### Install Mustache for Fantom

Install from [Eggbox](http://eggbox.fantomfactory.org/pods/mustache)

    fanr install mustache

### Install Sqlite

- Download Sqlite JDBC driver from
  [Github](https://github.com/xerial/sqlite-jdbc/releases)

- Copy the `.jar` file to subdir `lib/java/ext/` 
