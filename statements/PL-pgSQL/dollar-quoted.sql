select 'something';
select 'I''m also string';
-- or
--select E'I\'m string'; -- in old version of postgres

/* 
The following shows the syntax of the dollar-quoted string constants:
$tag$<string_constant>$tag$
*/
select $$ Hello! I'm Nikita\ $$;

/*
dollar-quoted string with tag 
*/
select $message$Hello, World!$message$;

/* 
Summary:
 - Use quoted-dollar string constants to avoid escaping single quotes or backslashes.
 - Always use quoted-dollar string constants in user-defined functions and stored procedures to make the code more readable.
*/
