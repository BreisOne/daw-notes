-- permite que las notas no estén asociadas a un usuario específico
USE notas;
ALTER TABLE nota
modify idUsuario int DEFAULT NULL;