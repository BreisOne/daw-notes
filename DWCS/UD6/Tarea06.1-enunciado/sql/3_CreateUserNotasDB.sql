/* drop user 'user-notas'@'localhost';
flush privileges; */
CREATE USER 'user-notas'@'localhost'
    IDENTIFIED BY 'abc123.';
GRANT CREATE,ALTER,INSERT,SELECT,UPDATE,DELETE
    ON notas.*
  TO 'user-notas'@'localhost';