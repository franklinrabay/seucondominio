ALTER TABLE `venda_produto` ADD `preco` DECIMAL(10,2) NOT NULL ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(71) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `permissao` varchar(31) NOT NULL DEFAULT 'publico',
  `nome` varchar(61) NOT NULL,
  `telefone` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;
