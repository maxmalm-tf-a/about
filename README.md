# about

## backend

Wow, Java. I've never done anything in Java before so this was for me a very interesting and scary challenge. 

I've used Jersey (as instructed) and scaffolded a project with Maven using the simple-service archetype according to the docs (https://jersey.java.net/documentation/latest/getting-started.html#new-from-archetype).

There's mostly two classes I've worked with. MyResource.java (which was in the archetype, but I've since extended it) and Database.java

* `MyResource.java` contains all the routes available (`/account`, `/verifytoken`, `/transactions`, `/populate`).
* `Database.java` contains all calls made from MyResource.java to the database, for example `Database.createToken` which creates a token on login and registration which is then used for stateless REST-usage (currently a UUID-string, todo: implement JWT).
* `Main.java` the entry point of the application, starts the server (from the archetype, almost intact)
* `JSONUtil.java` is a borrowed class to turn a ResultSet into JSON (from https://code.google.com/p/bonex-homerunning/source/browse/trunk/+bonex-homerunning/WEB-INF/src/java/com/bonex/sys/util/JSONUtil.java?spec=svn18&r=18)
* `CORS.java` is supposed to set CORS to * on all requests. It's from the docs (https://jersey.java.net/documentation/latest/filters-and-interceptors.html#d0e9580) but I haven't got this to work yet

For password hashing I've decided to go with bcrypt. First I was leaning on scrypt but reading about it I've ultimatly decided to with bcrypt because it's older and more tested. 

Database wise I chose PostgreSQL. I wanted to revisit a SQL-database since I've been working NoSQL-databases a lot recently. Looking at PostgreSQL vs MySQL I decided to go with Postgres because the JDBC Driver looked easy enough to work with.

## frontend

For the frontend part I was told I could do freely as I wanted in terms of framework (or without). I've wanted to revisit AngularJS for a while now and I decided to go with that over React coupled with something else since this is my first time with Java I wanted something I could feel somewhat safe with.

It's a rather simple application for now. Try to login in to the Java backend -> receive token if correct credentials -> store token and use with each request -> redirect to `/login` if token wasn't present/valid. 

CSS framework used is One Nexus (http://www.onenexusproject.com/)
