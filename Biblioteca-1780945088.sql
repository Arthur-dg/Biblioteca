CREATE TABLE IF NOT EXISTS `Autores` (
	`id_autor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`data_nasc` date NOT NULL,
	`nacionalidade` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`id_autor`)
);
CREATE TABLE IF NOT EXISTS `Editores` (
	`id_editora` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`cnpj` varchar(255) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	`estado` varchar(2) NOT NULL,
	`pais` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	PRIMARY KEY (`id_editora`)
);
CREATE TABLE IF NOT EXISTS `Categorias` (
	`id_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_categoria` varchar(50) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);
CREATE TABLE IF NOT EXISTS `Livros` (
	`ISBN` int AUTO_INCREMENT NOT NULL UNIQUE,
	`titulo` varchar(50) NOT NULL,
	`data_publicacao` date NOT NULL,
	`id_autor` int NOT NULL,
	`id_editora` int NOT NULL,
	`id_categoria` int NOT NULL,
	PRIMARY KEY (`ISBN`)
);
CREATE TABLE IF NOT EXISTS `Cadastros` (
	`cpf` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`tefefone` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`cpf`)
);
CREATE TABLE IF NOT EXISTS `Emprestimo` (
	`id_emprestimo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_emprestimo` date NOT NULL,
	`data_entrega` date NOT NULL,
	`ISBN` int NOT NULL,
	`cpf` varchar(11) NOT NULL,
	PRIMARY KEY (`id_emprestimo`)
);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk3` FOREIGN KEY (`id_autor`) REFERENCES `Autores`(`id_autor`);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk4` FOREIGN KEY (`id_editora`) REFERENCES `Editores`(`id_editora`);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk5` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias`(`id_categoria`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk3` FOREIGN KEY (`ISBN`) REFERENCES `Livros`(`ISBN`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk4` FOREIGN KEY (`cpf`) REFERENCES `Cadastros`(`cpf`);