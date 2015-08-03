# Installing Bank of Old town

## Backend

Runs on port 1337

### Prerequisites

Java 7, Maven, PostgreSQL

### SQL data

Import the SQL data from `backend.sql` (in this repo). User `test` and password `test` is hardcoded for this demo

### Install and run

    git clone https://github.com/maxmalm-tf-a/backend.git
    cd backend
    mvn exec:java

## Frontend

Serves to port 9000

### Prerequisites

node, npm, bower

### Install and run

    git clone https://github.com/maxmalm-tf-a/frontend.git
    cd frontend
    npm install && bower install
    gulp serve
