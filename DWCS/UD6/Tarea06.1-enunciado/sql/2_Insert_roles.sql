USE notas;

INSERT INTO `rol`(`id`, `name`) VALUES (1,'admin'), (2, 'user');


INSERT INTO `usuario`(`id`, `email`, `pwdhash`) VALUES (1,'user1@edu.es','$2y$10$wnH5AW7Tk7WFsAjRr8r.2.hJV8Bn.1kXV5WsQR11iCT2.pNjvvXEW');
INSERT INTO `usuario`(`id`, `email`, `pwdhash`) VALUES (2,'user2@edu.es','$2y$10$21zpjzgVWLO65cnOxvY2iuF6d2ZXu2nza8QkKDIiHHQoQEGPASV4W');

INSERT INTO `usuario_rol`(`idUsuario`, `idRol`) VALUES (1,1);
INSERT INTO `usuario_rol`(`idUsuario`, `idRol`) VALUES (1,2);

INSERT INTO `usuario_rol`(`idUsuario`, `idRol`) VALUES (2,2);

