# PostgreSQL PL/pgSQL

PL/pgSQL procedural language adds many procedural elements, e.g., control structures, loops, and complex computations, to extend standard SQL. It allows you to develop complex functions and stored procedures in PostgreSQL that may not be possible using plain SQL.

So, pgSQL:
- PL/pgSQL comes with PostgreSQL by default. The user-defined functions and stored procedures developed in PL/pgSQL can be used like any built-in functions and stored procedures.
- PL/pgSQL inherits all user-defined types, functions, and operators.
- PL/pgSQL has many features that allow you to develop complex functions and stored procedures.
- PL/pgSQL can be defined to be trusted by the PostgreSQL database server.

## Advantages of using PL/pgSQL

PL/pgSQL wraps multiple statements in an object and store it on the PostgreSQL database server.
So instead of sending multiple statements to the server one by one, you can send one statement to execute the object stored in the server. This allows you to:
- Reduce the number of round trips between the application and the PostgreSQL database server.
- Avoid transferring the immediate results between the application and the server.

## PostgreSQL PL/pgSQL disadvantages

Besides the advantages of using PL/pgSQL, there are some caveats:
- Difficult to manage versions and hard to debug.
- May not be portable to other database management systems.
