# about

## backend

Wow, Java. I've never done anything in Java before so this was for me a very interesting and scary challenge. 

I've used Jersey (as instructed) and scaffolded a project with Maven using the simple-service archetype according to the docs (https://jersey.java.net/documentation/latest/getting-started.html#new-from-archetype).

There's mostly two classes I've worked with. MyResource.java (which was in the archetype, but I've since extended it) and Database.java

MyResource.java contains all the routes available (`/account`, `/verifytoken`, `/transactions`, `/populate`).

Database.java contains all calls made from MyResource.java to the database, for example `Database.createToken` which creates a token on login and registration which is then used for stateless REST-usage (currently a UUID-string, todo: implement JWT).

For password hashing I've decided to go with bcrypt. First I was leaning on scrypt but reading about it I've ultimatly decided to with bcrypt because it's older and more tested. 

Database wise I chose PostgreSQL. I wanted to revisit a SQL-database since I've been working NoSQL-databases a lot recently. Looking at PostgreSQL vs MySQL I decided to go with Postgres because the JDBC Driver looked easy enough to work with.
