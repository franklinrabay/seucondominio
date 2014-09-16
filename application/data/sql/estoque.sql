-- phpMyAdmin SQL Dump
-- version 4.1.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 08-Abr-2014 às 21:42
-- Versão do servidor: 5.5.35-0ubuntu0.12.04.2
-- PHP Version: 5.4.26-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `estoque`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizaEstoque`(IN `id_prod` INT, IN `id_venda` INT, IN `qtde` INT)
BEGIN
 declare contador int(11);

SELECT count(*) into contador FROM venda_produto WHERE id_produto = id_prod AND id_venda = id_venda;

IF contador > 0 THEN
  UPDATE estoque SET quantidade = quantidade - qtde WHERE id_produto = id_prod;
END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` text NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `excluido` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `telefone`, `cnpj`, `excluido`) VALUES
(2, 'Valda', 'Rua Manoel Belarmino de Macedo', '8888-8888', '34343', 0),
(3, 'Ingrid Nobrega', 'Rua Manoel Belarmino de Macedo', '8709-9609', '012939238', 0),
(4, 'Igor', 'Rua Manoel Belarmino de Macedo', '9999999', '998812/1234', 1),
(5, 'Paulina Cadó', 'Rua Manoel B', '88888877', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `id_produto`, `quantidade`) VALUES
(1, 2, 78),
(2, 3, 5),
(3, 4, 21),
(4, 5, 4),
(5, 6, 3),
(6, 7, 3),
(7, 8, 44),
(8, 9, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL,
  `excluido` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `preco`, `descricao`, `excluido`) VALUES
(2, 'Energético', 10.20, 'novo energético da one thor', 1),
(3, 'Energético', 41.22, 'novo energetico', 0),
(4, 'Cama Box', 12.21, 'cama eletronica da one thor', 0),
(5, 'geladeira', 50000.00, 'geladeira brastemp', 1),
(6, 'Celular', 2.00, 'da china', 1),
(7, 'Copo', 15.00, 'copo de vidro da durepox', 0),
(8, 'Whey', 200.50, 'whey protein', 1),
(9, 'Camisa', 100.00, 'Camisa da one thor', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `id_venda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) unsigned NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venda`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `id_cliente`, `data`) VALUES
(3, 5, '2014-04-04 02:40:43'),
(4, 5, '2014-04-04 02:42:08'),
(5, 3, '2014-04-04 02:45:24'),
(6, 2, '2014-04-08 02:14:39'),
(7, 5, '2014-04-08 02:23:54'),
(8, 3, '2014-04-08 02:44:37'),
(9, 5, '2014-04-08 02:48:34'),
(10, 3, '2014-04-08 23:21:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_produto`
--

CREATE TABLE IF NOT EXISTS `venda_produto` (
  `id_venda_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_venda` int(10) unsigned NOT NULL,
  `id_produto` int(10) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_venda_produto`),
  KEY `id_venda` (`id_venda`),
  KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `venda_produto`
--

INSERT INTO `venda_produto` (`id_venda_produto`, `id_venda`, `id_produto`, `quantidade`) VALUES
(3, 4, 3, 10),
(4, 5, 3, 5),
(5, 5, 4, 4),
(6, 5, 7, 3),
(7, 5, 9, 2),
(8, 6, 3, 15),
(9, 7, 4, 15),
(10, 8, 3, 50),
(11, 9, 4, 6),
(12, 9, 7, 9),
(13, 10, 7, 17);

--
-- Acionadores `venda_produto`
--
DROP TRIGGER IF EXISTS `TGR_entrada_produto`;
DELIMITER //
CREATE TRIGGER `TGR_entrada_produto` AFTER INSERT ON `venda_produto`
 FOR EACH ROW BEGIN
CALL atualizaEstoque (new.id_produto, new.id_venda, new.quantidade);
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `venda_produto_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`),
  ADD CONSTRAINT `venda_produto_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
