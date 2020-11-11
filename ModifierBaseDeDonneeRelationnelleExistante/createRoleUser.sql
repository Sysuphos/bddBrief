CREATE ROLE 'staff'@'localhost' , 'viewer'@'localhost';

GRANT ALL PRIVILEGES ON BreizhVideo.*
to staff;

GRANT SELECT ON BreizhVideo.*
to viewer;

CREATE USER 'yannick' IDENTIFIED BY 'Password!11';

GRANT staff
TO yannick;

CREATE USER 'oslo' IDENTIFIED BY 'Password!22';

GRANT SELECT ON BreizhVideo.* 
to oslo;

GRANT INSERT ON BreizhVideo.preference
to oslo;
 
