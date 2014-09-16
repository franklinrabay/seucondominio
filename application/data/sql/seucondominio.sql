-- phpMyAdmin SQL Dump
-- version 4.2.0-rc1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 16/09/2014 às 17:30
-- Versão do servidor: 5.5.38-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `seucondominio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tarefa`
--

CREATE TABLE IF NOT EXISTS `tb_tarefa` (
`id` int(11) NOT NULL,
  `titulo` varchar(128) NOT NULL,
  `valor` varchar(16) NOT NULL,
  `inicio` date NOT NULL,
  `conclusao` date NOT NULL,
  `status` enum('CONCLUIDO','PENDENTE','EM ANDAMENTO','') NOT NULL,
  `imovel_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Fazendo dump de dados para tabela `tb_tarefa`
--

INSERT INTO `tb_tarefa` (`id`, `titulo`, `valor`, `inicio`, `conclusao`, `status`, `imovel_id`) VALUES
(7, 'Exemplo', '100', '0000-00-00', '0000-00-00', 'PENDENTE', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tarefa_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_tarefa_mensagem` (
`id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `data` date NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tarefa_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Fazendo dump de dados para tabela `tb_tarefa_mensagem`
--

INSERT INTO `tb_tarefa_mensagem` (`id`, `texto`, `data`, `usuario_id`, `tarefa_id`) VALUES
(50, 'xlow', '2014-09-16', 1, 7),
(51, 'LoLoLoL', '2014-09-16', 1, 7);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tb_tarefa`
--
ALTER TABLE `tb_tarefa`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_tarefa_mensagem`
--
ALTER TABLE `tb_tarefa_mensagem`
 ADD PRIMARY KEY (`id`), ADD KEY `tarefa_id` (`tarefa_id`), ADD KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tb_tarefa`
--
ALTER TABLE `tb_tarefa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `tb_tarefa_mensagem`
--
ALTER TABLE `tb_tarefa_mensagem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `tb_tarefa_mensagem`
--
ALTER TABLE `tb_tarefa_mensagem`
ADD CONSTRAINT `tb_tarefa_mensagem_ibfk_1` FOREIGN KEY (`tarefa_id`) REFERENCES `tb_tarefa` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
