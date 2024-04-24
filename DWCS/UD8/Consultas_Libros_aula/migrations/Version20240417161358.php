<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240417161358 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE autor (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, fecha_nacimiento DATE DEFAULT NULL COMMENT \'(DC2Type:date_immutable)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE editorial (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE libro (id INT AUTO_INCREMENT NOT NULL, editorial_id INT DEFAULT NULL, titulo VARCHAR(200) NOT NULL, fecha_publicacion DATE DEFAULT NULL COMMENT \'(DC2Type:date_immutable)\', unidades_vendidas INT DEFAULT NULL, INDEX IDX_5799AD2BBAF1A24D (editorial_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE libro_autor (libro_id INT NOT NULL, autor_id INT NOT NULL, INDEX IDX_F7588AEFC0238522 (libro_id), INDEX IDX_F7588AEF14D45BBE (autor_id), PRIMARY KEY(libro_id, autor_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE libro ADD CONSTRAINT FK_5799AD2BBAF1A24D FOREIGN KEY (editorial_id) REFERENCES editorial (id)');
        $this->addSql('ALTER TABLE libro_autor ADD CONSTRAINT FK_F7588AEFC0238522 FOREIGN KEY (libro_id) REFERENCES libro (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE libro_autor ADD CONSTRAINT FK_F7588AEF14D45BBE FOREIGN KEY (autor_id) REFERENCES autor (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE nota CHANGE fecha_modificacion fecha_modificion DATETIME NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE libro DROP FOREIGN KEY FK_5799AD2BBAF1A24D');
        $this->addSql('ALTER TABLE libro_autor DROP FOREIGN KEY FK_F7588AEFC0238522');
        $this->addSql('ALTER TABLE libro_autor DROP FOREIGN KEY FK_F7588AEF14D45BBE');
        $this->addSql('DROP TABLE autor');
        $this->addSql('DROP TABLE editorial');
        $this->addSql('DROP TABLE libro');
        $this->addSql('DROP TABLE libro_autor');
        $this->addSql('ALTER TABLE nota CHANGE fecha_modificion fecha_modificacion DATETIME NOT NULL');
    }
}
