-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Mar-2022 às 23:14
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `greenwallet`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_carteira`
--

CREATE TABLE `tab_carteira` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `renda` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tab_carteira`
--

INSERT INTO `tab_carteira` (`id`, `id_usuario`, `renda`) VALUES
(1, 1, '1300.00'),
(2, 2, '1000.00'),
(3, 3, '100.00'),
(4, 4, '1000.00'),
(5, 5, '1000.00'),
(6, 6, '1100.00'),
(7, 7, '10000.00'),
(8, 8, '10000.00'),
(9, 9, '1000.00'),
(10, 10, '3000.00'),
(11, 11, '7000.00'),
(12, 12, '10.00'),
(13, 13, '-500.00'),
(14, 14, '100.00'),
(15, 15, '1300.00'),
(16, 17, '3000.00'),
(17, 18, '5000.00'),
(18, 20, '1111.00'),
(19, 21, '5000.00'),
(20, 22, '1500.00'),
(21, 23, '1700.00'),
(22, 24, '100.00'),
(23, 25, '1700.00'),
(24, 27, '1200.00'),
(25, 28, '385.00'),
(26, 29, '5000.00'),
(27, 30, '1111.00'),
(28, 31, '200.00'),
(29, 32, '10000.00'),
(30, 33, '2000.00'),
(31, 34, '500.00'),
(32, 35, '1100.00'),
(33, 36, '1.00'),
(34, 37, '1345.00'),
(35, 38, '1500.00'),
(36, 39, '0.00'),
(37, 40, '1250.00'),
(38, 41, '3000.00'),
(39, 42, '1500.00'),
(40, 43, '5000.00'),
(41, 44, '1500.00'),
(42, 45, '10.00'),
(43, 46, '2000.00'),
(44, 47, '1600.00'),
(45, 48, '1200.00'),
(46, 49, '5000.00'),
(47, 50, '100.00'),
(48, 51, '1500.00'),
(49, 52, '2500.00'),
(50, 53, '10000.00'),
(51, 54, '2000.00'),
(52, 55, '1569.00'),
(53, 56, '2200.00'),
(54, 57, '2000.00'),
(55, 58, '15.50'),
(56, 59, '10000.00'),
(57, 60, '15000.00'),
(58, 62, '3.00'),
(59, 63, '1.00'),
(60, 64, '0.10'),
(61, 65, '8000.00'),
(62, 66, '7025.95'),
(63, 67, '1000.00'),
(64, 68, '2200.00'),
(65, 69, '1500.00'),
(66, 70, '100.00'),
(67, 71, '8000.00'),
(68, 72, '20000.00'),
(69, 73, '0.00'),
(70, 74, '1200.00'),
(71, 75, '1500.00'),
(72, 76, '5000.00'),
(73, 77, '5000.00'),
(74, 78, '9000.00'),
(75, 79, '5000.00'),
(76, 80, '5000.00'),
(77, 81, '2000.00'),
(78, 82, '1.00'),
(79, 83, '10000.00'),
(80, 84, '25000.00'),
(81, 85, '1500.00'),
(82, 86, '1500.00'),
(83, 87, '500.00'),
(84, 88, '10000.00'),
(85, 89, '1.00'),
(86, 90, '3000.00'),
(87, 91, '100.00'),
(88, 92, '1500.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_gastos`
--

CREATE TABLE `tab_gastos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  `pagamento` int(1) DEFAULT NULL,
  `data_gasto` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tab_gastos`
--

INSERT INTO `tab_gastos` (`id`, `id_usuario`, `tipo`, `valor`, `pagamento`, `data_gasto`, `descricao`) VALUES
(1, 1, 0, '500.00', 0, '2021-10-21', 'Testando nova API'),
(26, 1, 1, '500.00', 0, '2021-10-19', 'teste gethistory'),
(27, 1, 0, '500.00', 0, '2021-10-19', 'editei jotave'),
(28, 1, 2, '200.00', 1, '2021-10-20', 'teste gethistory 3'),
(29, 1, 5, '100.00', 1, '2021-10-20', 'teste gethistory 4'),
(30, 6, 1, '123.00', 4, '2021-10-28', ''),
(32, 7, 2, '1000.00', 2, '2021-10-25', 'o viado do uel só da gasto'),
(33, 5, 2, '450.00', 0, '2021-10-11', 'Compras do mês'),
(40, 1, 5, '1.00', 5, '2021-10-01', 'Teste ordem'),
(41, 1, 1, '2.00', 4, '2021-10-30', 'Teste ordem'),
(57, 2, 5, '1.00', 0, '2021-10-02', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAA'),
(58, 2, 1, '12.00', 0, '2021-10-03', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAA'),
(60, 2, 0, '12.00', 0, '2021-10-03', 'teste'),
(61, 2, 1, '31.00', 0, '2021-10-06', '12'),
(63, 10, 3, '130.00', 1, '2021-11-03', 'Loja de roupas'),
(64, 10, 2, '430.00', 2, '2021-11-03', 'Mercearia'),
(65, 7, 2, '500.00', 1, '2021-11-06', 'Putero'),
(67, 11, 5, '1500.00', 5, '2021-11-02', 'Lenço da Gucci'),
(68, 12, 3, '50.00', 0, '2021-11-25', 'Casa do pacheco'),
(69, 13, 5, '500.00', 0, '2021-11-24', 'HAmbuerguer'),
(85, 14, 0, '113.00', 0, '2021-07-22', 'Chocolate'),
(86, 14, 4, '680.00', 2, '2021-01-03', 'Juice'),
(87, 14, 1, '46.00', 0, '2021-08-22', 'Soda'),
(89, 14, 2, '898.00', 3, '2021-11-07', 'Candy'),
(91, 14, 4, '746.00', 4, '2021-11-07', 'Ice Cream'),
(93, 14, 4, '987.00', 0, '2021-11-07', 'Pasta'),
(94, 14, 3, '397.00', 0, '2021-11-07', 'Coffee'),
(95, 14, 4, '352.00', 4, '2021-11-07', 'Pasta'),
(96, 14, 1, '244.00', 2, '2021-11-07', 'Coffee'),
(97, 14, 3, '717.00', 4, '2021-11-07', 'Pasta'),
(99, 14, 3, '606.00', 4, '2021-11-07', 'Ice Cream'),
(100, 14, 2, '336.00', 0, '2021-11-07', 'Coffee'),
(101, 14, 3, '745.00', 0, '2021-11-07', 'Pasta'),
(102, 14, 3, '327.00', 1, '2021-11-07', 'Juice'),
(105, 14, 3, '120.00', 2, '2021-11-07', 'sharkguei'),
(106, 14, 2, '300.00', 3, '2021-11-07', 'sharkyay'),
(107, 14, 1, '758.00', 1, '2021-11-07', 'Colucci do Rock - 4'),
(108, 14, 2, '604.00', 5, '2021-11-07', 'Colucci do Rock - 9'),
(109, 14, 2, '318.00', 5, '2021-11-07', 'Colucci do Rock - 8'),
(111, 14, 1, '932.00', 1, '2021-11-07', 'Colucci do Rock - 6'),
(112, 14, 1, '631.00', 1, '2021-11-07', 'Colucci do Rock - 7'),
(114, 14, 1, '817.00', 1, '2021-11-07', 'Shark do Rock - 9'),
(116, 14, 1, '797.00', 1, '2021-11-07', 'Shark do Rock - 3'),
(118, 5, 2, '1000.00', 3, '2021-11-07', 'Exemplo-02'),
(122, 1, 1, '500.00', 0, '2021-11-10', 'teste gráfico'),
(123, 5, 3, '19000.00', 0, '2021-11-15', 'Exemplo-01'),
(126, 5, 5, '12000.00', 3, '2021-11-10', 'iphone'),
(129, 5, 0, '21000.00', 1, '2021-11-21', 'Exemplo-02'),
(131, 2, 0, '43.00', 0, '2021-11-24', '23'),
(133, 18, 4, '1500.00', 0, '2021-11-09', '01'),
(134, 18, 1, '1500.00', 0, '2021-11-14', '02'),
(135, 18, 3, '2000.00', 3, '2021-11-17', '03'),
(136, 17, 3, '1570.00', 0, '2021-11-16', '02'),
(137, 20, 3, '80.65', 1, '2021-03-07', 'testando essa MERDA'),
(139, 20, 3, '80.65', 1, '2021-03-07', 'testando essa BAMOS'),
(142, 20, 1, '80.65', 1, '2021-03-10', 'não é pra estar aqui'),
(143, 20, 2, '200.65', 1, '2021-03-10', 'vamos'),
(144, 20, 4, '50.65', 1, '2021-03-11', 'vamos'),
(145, 20, 5, '50.65', 1, '2021-03-12', 'vamos'),
(146, 20, 1, '150.65', 1, '2021-03-12', 'vamos'),
(147, 20, 1, '150.65', 1, '2021-03-12', 'vamos'),
(148, 20, 0, '480.65', 1, '2021-03-12', 'vamos'),
(149, 21, 1, '200.00', 0, '2021-11-01', 'teste'),
(150, 21, 2, '500.00', 3, '2021-11-02', 'teste2'),
(151, 21, 3, '55.90', 4, '2021-11-11', 'teste3'),
(152, 22, 3, '50.00', 1, '2021-11-24', 'Droga'),
(153, 23, 4, '300.00', 2, '2021-11-24', 'pneu furado'),
(154, 23, 5, '500.00', 3, '2021-11-10', 'carro'),
(155, 23, 2, '50.00', 1, '2021-11-23', 'janta'),
(156, 2, 4, '43.00', 0, '2021-11-06', '43'),
(157, 25, 0, '300.00', 0, '2021-11-27', 'luz'),
(158, 25, 5, '64.90', 2, '2021-11-26', 'celular'),
(159, 25, 0, '40.00', 2, '2021-11-25', 'água'),
(160, 2, 1, '34.00', 2, '2021-11-04', '1'),
(161, 2, 2, '120.00', 1, '2021-11-04', '120'),
(162, 2, 5, '34.00', 1, '2021-11-04', '546'),
(163, 2, 4, '45.00', 0, '2021-11-03', 'das'),
(164, 2, 3, '4.00', 0, '2021-11-03', '213'),
(165, 33, 2, '200.00', 1, '2021-11-29', 'Gasto 1'),
(166, 39, 0, '4800.00', 4, '2021-11-30', 'Cartao'),
(167, 39, 0, '1700.00', 4, '2021-11-30', 'Cartao 2'),
(168, 39, 0, '1000.00', 4, '2021-11-30', 'Cartao 3'),
(169, 39, 0, '1500.00', 4, '2021-11-30', 'Cartao 4'),
(170, 39, 0, '1800.00', 0, '2021-11-30', 'Aluguel'),
(171, 39, 0, '2300.00', 0, '2021-11-30', 'APTO SP'),
(172, 39, 0, '1000.00', 1, '2021-11-30', 'Pensao'),
(173, 43, 0, '99.00', 2, '2021-11-29', 'Internet'),
(174, 49, 0, '800.00', 0, '2021-11-05', 'Aluguel'),
(175, 52, 5, '8500.00', 0, '2021-11-29', 'PC'),
(176, 53, 2, '125.00', 3, '2021-11-29', 'Teste'),
(177, 54, 2, '45.00', 1, '2021-11-30', 'Gg'),
(178, 57, 2, '350.00', 3, '2021-11-30', 'Putas'),
(179, 59, 2, '45345.00', 0, '2021-11-18', 'sdfsdfsdsdf'),
(180, 59, 1, '123.00', 0, '2021-11-18', 'aaaaa'),
(182, 29, 1, '123.00', 0, '2021-11-18', 'aaaaa'),
(183, 66, 2, '50.00', 1, '2021-11-30', 'Teste'),
(184, 1, 0, '1.00', 0, '1990-10-10', 'Cuidado onde armazena os dado'),
(185, 71, 0, '10.00', 0, '1111-01-01', 'oi(teste validacao data)'),
(186, 71, 0, '10.00', 0, '1111-11-30', 'teste de data'),
(187, 1, 1, '110.00', 1, '1111-11-11', 'teste de data'),
(188, 1, 0, '1.00', 0, '0001-01-01', 'oi'),
(189, 1, 0, '1.00', 0, '2022-01-01', 'oi'),
(193, 74, 5, '300.00', 3, '2021-11-30', 'carro'),
(194, 74, 4, '300.00', 2, '2021-11-25', 'conserto pneu'),
(195, 74, 2, '90.00', 0, '2021-11-20', 'janta mc donalds'),
(196, 79, 0, '1450.00', 4, '2021-11-11', 'Aluguel'),
(197, 83, 4, '2000.00', 1, '2021-11-30', 'rapadura'),
(198, 86, 4, '500.00', 1, '2021-12-01', 'Carro troca de pneu'),
(199, 86, 2, '50.00', 2, '2021-12-01', 'Buguer king'),
(200, 87, 0, '300.00', 0, '2021-12-01', 'Aluguel'),
(202, 92, 4, '45.00', 3, '2021-12-01', 'Pneu'),
(203, 92, 1, '350.00', 2, '2021-12-01', 'Óculos'),
(204, 92, 5, '148.00', 3, '2021-12-01', 'Decoração');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_lucros`
--

CREATE TABLE `tab_lucros` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tab_lucros`
--

INSERT INTO `tab_lucros` (`id`, `id_usuario`, `valor`, `data`, `descricao`) VALUES
(9, 2, '5.00', '2021-10-06', 'pai é monstro'),
(10, 5, '450.00', '2021-10-12', 'grana'),
(11, 1, '1003.00', '2021-10-31', 'Teste lucro'),
(12, 7, '784.00', '2021-10-20', 'sdrth'),
(17, 10, '430.00', '2021-11-03', 'Comércio'),
(18, 7, '250.00', '2021-11-30', 'rio guaçu'),
(19, 10, '70.00', '2021-11-03', 'Mercado'),
(20, 11, '10000.00', '2021-11-03', 'Papai doce'),
(21, 12, '5.00', '2021-11-13', '5'),
(22, 13, '100.00', '2021-11-01', 'HAmbuerguer'),
(24, 1, '100.00', '2021-11-04', 'lucro'),
(38, 14, '100.00', '2021-11-19', 'Venda de Cookies'),
(39, 14, '100.00', '2021-11-08', 'Jogo do bicho'),
(40, 14, '612.00', '2021-11-07', 'Coffee'),
(41, 14, '213.00', '2021-11-07', 'Coffee'),
(42, 14, '698.00', '2021-11-07', 'Candy'),
(44, 14, '331.00', '2021-11-07', 'Coffee'),
(45, 14, '419.00', '2021-11-07', 'Cake'),
(46, 14, '526.00', '2021-11-07', 'Chocolate'),
(49, 14, '631.00', '2021-11-07', 'Juice'),
(50, 14, '294.00', '2021-11-07', 'Juice'),
(51, 14, '652.00', '2021-11-07', 'Pizza'),
(52, 14, '279.00', '2021-11-07', 'Pizza'),
(53, 14, '72.00', '2021-11-07', 'Cake'),
(55, 14, '278.00', '2021-11-07', 'Pizza'),
(56, 14, '346.00', '2021-11-07', 'Candy'),
(57, 14, '864.00', '2021-11-07', 'Pasta'),
(58, 14, '916.00', '2021-11-07', 'Ice Cream'),
(60, 14, '764.00', '2021-11-07', 'Water'),
(61, 14, '389.00', '2021-11-07', 'Water'),
(62, 14, '808.00', '2021-11-07', 'Cake'),
(63, 14, '779.00', '2021-11-07', 'Pasta'),
(64, 14, '916.00', '2021-11-07', 'Soda'),
(65, 14, '497.00', '2021-11-07', 'Ice Cream'),
(67, 14, '436.00', '2021-11-07', 'Candy'),
(70, 5, '50000.00', '2021-11-09', 'Exemplo'),
(74, 1, '200.00', '2021-11-10', 'lucro 2'),
(76, 2, '3123.00', '2021-11-04', 'Teste'),
(77, 17, '2000.00', '2021-11-10', '01'),
(79, 20, '340.00', '2021-05-25', 'comi o cu do shark MESMO'),
(80, 20, '340.00', '2021-05-25', 'comi o cu do shark MESMO'),
(81, 20, '111.00', '2021-11-11', 'estou editado 1'),
(82, 20, '80.00', '2021-01-12', 'comi o cu do shark oioioiooioi'),
(83, 21, '90.00', '2021-11-15', 'prodt'),
(84, 22, '800.00', '2021-11-24', 'Dinheiro Agiota'),
(85, 23, '100.00', '2021-11-24', 'venda de geladinho'),
(86, 31, '3.00', '2021-11-26', '98'),
(87, 39, '930.00', '2021-11-30', 'Salario'),
(88, 39, '6622.50', '2021-11-30', 'Salario Cooper'),
(89, 39, '10300.00', '2021-11-30', 'Salario Sifra'),
(90, 40, '235.00', '2021-11-10', 'Décimo Terceiro'),
(91, 52, '15000.00', '2021-11-29', 'Teste'),
(92, 58, '1500.00', '2021-11-30', 'Salário'),
(94, 74, '60.00', '2021-11-22', 'venda de camiseta'),
(95, 81, '2000.00', '2021-11-30', 'Pagamento'),
(96, 86, '350.00', '2021-12-01', 'Venda de Sofa'),
(97, 87, '23.00', '2021-12-01', 'juros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_usuarios`
--

CREATE TABLE `tab_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(12) DEFAULT NULL,
  `sobrenome` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `data_c` date DEFAULT NULL,
  `sexo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tab_usuarios`
--

INSERT INTO `tab_usuarios` (`id`, `nome`, `sobrenome`, `email`, `senha`, `data_c`, `sexo`) VALUES
(1, 'Matheus', 'Biazotto', 'matheus@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-21', 2),
(2, 'JV', 'Oliveira', 'jv@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-21', 1),
(3, 'shark', 'linto', 'shark@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-21', 1),
(4, 'amanda', 'catrina', 'amandinha019@gmail.com', 'e2daa7e7fb898e915f0471588757e057cef958c5', '2021-10-21', 0),
(5, 'pao', 'fofo', 'teste@teste.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-24', 2),
(6, 'Dalva', 'Cleidei', 'dalvacavalos@hotmail.com', '7e21bea144f9ddac952c79d884ba32e1c9a6f192', '2021-10-25', 1),
(7, 'Otávio2', 'Lindo', 'vrau@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-25', 0),
(8, 'Felipe ', 'França', 'lipefranca29@hotmail.com', '5db7e05164c512289a38108c8c65e71591a66448', '2021-10-25', 0),
(9, 'joao', 'oliveira', 'joao@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-10-31', 0),
(10, 'Breno', 'Nunes', 'brenonunesnogueira18@outlook.com', 'fb359d25525f9ac448f0c1aaed5a36cf43c84ac7', '2021-11-03', 0),
(11, 'StephanyaWn', 'Lacrean Ciss', 'olacredagatan@email.com', 'b6e8cc1daeb5de1a2fa8661ca3da01186ad6a5c4', '2021-11-03', 1),
(12, 'Leonardo', 'Ferreira', 'leo.elias.lef@gmail.com', '76ffb6e16a368c0ff882cef59b762825e7e92a32', '2021-11-03', 0),
(13, 'Matheus', 'Pires', 'matheuspires342@gmail.com', '5d5eeaaa4199597c3dd6acb0568d385cd7d4d0c0', '2021-11-03', 0),
(14, 'Rato', 'Pelado', 'rato@gmail.com', '0c1e58e870990b44ef73b9e4c6bf02d77ea5cf66', '2021-11-07', 2),
(15, 'Caio', 'Santos', 'caio@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-10', 1),
(16, 'teste', 'smeteste', 'teste@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-17', 0),
(17, 'Letícia', 'L.', 'leticia@email.com', '8cb2237d0679ca88db6464eac60da96345513964', '2021-11-18', 1),
(18, 'aula', 'pp', 'aulap@email.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-18', 2),
(19, 'testando', '2testando', 'vamos@teste.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-20', 1),
(20, 'oioi', 'tavin', 'aiohsdg@gmail.com', '5e247b9b0cd11dd35c5b3468f9d5cf58398738b3', '2021-11-20', 0),
(21, 'Felipe', 'Feitosa', 'felipefeitosa@email.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-24', 0),
(22, 'Vitor', 'Souza', 'vitormarcelo043@gmail.com', 'a2aa399eb0b807e1d2c8333b7e456a9f7ed857d4', '2021-11-24', 0),
(23, 'etimds', '2021', 'etimds@email.com', '8cb2237d0679ca88db6464eac60da96345513964', '2021-11-25', 2),
(24, 'Victor Hugo ', 'Nascimento ', 'Vh.augusto123@gmail.com', '1fac5a502295efdae7c8294461888d47a62a17bb', '2021-11-26', 0),
(25, 'Testelulu', 'sobrenome', 'testelu@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-28', 1),
(26, 'grupo01', 'etec', 'grupo01@hotmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-28', 2),
(27, 'grupo01', 'etec', 'testeI@hotmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-29', 0),
(28, 'Mr', 'Kayze', 'support@anticheats.com.br', '7eb1574b6ec2b7254e7637975f63c3af1bbced49', '2021-11-29', 0),
(29, 'Denis', 'Teste', 'denisgustavopinheiro@gmail.com', '9d182f4d7622da5eb9abe56c2e53c3a15fe10ca7', '2021-11-29', 0),
(30, 'asdasdsadas', 'dasdsadasd', 'alessandro.mpgh@gmail.com', 'eb27b9e59b3d680f62300ac6f29969a69dc30a96', '2021-11-29', 0),
(31, 'Caio', 'Salchesttes ', 'caiossxdgamer@gmail.com', '608fd68cf088ba6c80d0de0670910e0cb3d17f60', '2021-11-29', 0),
(32, 'Teste', 'Teste', 'teste@teste.jp', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-29', 2),
(33, 'Maria', 'Maria', 'maria@gmail.com', '9ac20922b054316be23842a5bca7d69f29f69d77', '2021-11-29', 1),
(34, 'Evaristo', 'Paulo', 'evaripaulo@gmail.com', '72019bbac0b3dac88beac9ddfef0ca808919104f', '2021-11-29', 0),
(35, 'Gabriel', 'Vitor ', 'gabrielceda545@gmail.com', '557e726f16c35776189e32b9b53dae4f0e9a4d20', '2021-11-29', 0),
(36, 'Luis', 'Carlos', 'gopub.digitalmarketing@gmail.com', '0fb67d44c701243dddc7820aead14b7955b038ea', '2021-11-29', 1),
(37, 'João', 'Birelo Neto', 'njoao6016@gmail.com', '7b3f6a221c29039aa471bd6e8e76f21e05f26ea4', '2021-11-29', 0),
(38, 'Teste', 'Facebook', 'testedev@gmail.com', '5451459721ba64e4e0f2c589e6c1dd9e37219ba5', '2021-11-29', 0),
(39, 'Rafael', 'Corazzi', 'rafael.corazzi@hotmail.com', 'e6a9fc04320a924f46c7c737432bb0389d9dd095', '2021-11-29', 0),
(40, 'Dart', 'Verd', 'jedi@gmail.com', '1574a8776dc0846ff8ed43fae50a39e2d3d65ea6', '2021-11-29', 0),
(41, 'xjjsz', 'djjsjs', 'sjksksks@gmail.com', '2dfcb46e73231aa4b5f47579b19dbebfebed2a3b', '2021-11-29', 1),
(42, 'Teste', 'Teete', 'testebrbnu@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-29', 0),
(43, 'Eurico', 'Silva', 'euricojorge@gmail.com', '5d62e75e3a13f4e7b279af8e0396f8ba4eb3db6d', '2021-11-29', 0),
(44, 'Marco', 'KKK', 'marcao@gmail.com', '4fa992b4ea93bb4289faa34bced64545bee74e10', '2021-11-29', 0),
(45, 'Teste', 'Tesye', 'yesye@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-29', 0),
(46, 'Samuel', 'Crv', 'samuel.crvfrs@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-29', 0),
(47, 'Eliezer', 'Tavares', 'tavares.eliezer@yahoo.com', '94af6c4088103e96d349b87fe76774686b86faa5', '2021-11-29', 0),
(48, 'Yuri', 'Cardoso', 'cardosoyuri902@gmail.com', 'b9fb61d3e5e14272d1718d5cde23e02857f67366', '2021-11-29', 0),
(49, 'Lucas', 'Morais', 'lucasdasilva165@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-29', 0),
(50, 'Eduardo', 'Enke', 'eduardoenke@gmail.com', '4f37d24a88bf8bd5c8aa3083e040af34f1d1fa2f', '2021-11-29', 0),
(51, 'Wellington C', 'cccc', 'wellington.borsato@yahoo.com.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-29', 0),
(52, 'James', 'Bean', 'jilabo1494@servergem.com', 'd8f18b94c54328eb42d8aace07d58820e36eaf8a', '2021-11-29', 0),
(53, 'Carlos', 'Massa', '26572140@gmail.com', '29d5ae54b61a0615674cc556e25ce6666841f6f7', '2021-11-30', 0),
(54, 'Dueg', 'Huer', 'duego@gmail.com', '4b4e739494285f1e21c93ad201f6412ddd44644a', '2021-11-30', 2),
(55, 'Smskdkdj', 'Xjdjdjjd', 'dkdkdk@hotmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2021-11-30', 0),
(56, 'Soclano', 'Fuclano', 'teste@soclano.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-11-30', 0),
(57, 'Ralph', 'Oliver', 'ralph@gmail.com', 'b7a9681f61615b56e2d8f20afbf9dbedabd24df1', '2021-11-30', 2),
(58, 'Douglas', 'Ramiro', 'contato@douglasramiro.com.br', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(59, 'John', 'Lennon', 'john@mailinator.com', '2891baceeef1652ee698294da0e71ba78a2a4064', '2021-11-30', 2),
(60, 'Matheus ', 'Vicente', 'matheuspra00@outlook.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(61, 'Uugjkj', 'Gguugv', 'zuuzzgf', 'd528fca3b163c05703e88b5285440bec28ecf185', '2021-11-30', 1),
(62, 'e', 'we', 'weqewq!g,aodsms@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(63, 'Fabricio', 'Parola', 'brparola@gmail.com', 'eae41e324050993dac1cde2e501c76c471bf2583', '2021-11-30', 0),
(64, 'João', 'Pé de feijão', 'marcaotop@gmail.com', '591e28b6403a5cea675c19578a1eb1a0417829d4', '2021-11-30', 0),
(65, 'Jonathan', 'Martins', 'jonathan.rws@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(66, 'Igor', 'Henriques', 'henriquesigor@yahoo.com.br', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(67, 'Kaio', 'Chiarato', 'kaio3henriquemelo@gmail.com', '444528fc68f99ea0f4fe027cb6cbd262f2a707fe', '2021-11-30', 0),
(68, 'Jean ', 'Alves', 'jean.alves2@outlook.c', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(69, 'rene', 'junior', 'renejr286@gmail.com', '05bb7a2ba7dbe1aa37aa9271c1b79d521682305d', '2021-11-30', 0),
(70, 'Tester', 'Geater', 'teste@teste.teste', '2e6f9b0d5885b6010f9167787445617f553a735f', '2021-11-30', 0),
(71, 'bcrypt', '.js', 'fibola5540@simdpi.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-11-30', 0),
(72, 'Lalal', 'Akkaa', 'vavava@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-11-30', 0),
(73, 'Jonatan', 'Bortolon', 'jonatangabrielbortolon@outlook.com', '8cb2237d0679ca88db6464eac60da96345513964', '2021-11-30', 0),
(74, 'grupo', '01', 'grupoetec01teste@hotmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-11-30', 2),
(75, 'teste', 'apresentacao', 'testeapren@hotmail.com', 'e0f68134d29dc326d115de4c8fab8700a3c4b002', '2021-12-01', 2),
(76, 'Juvenal', 'Antenal', 'a.juvenal@email.net.br', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-12-01', 0),
(77, 'Matheus', 'Loubach', 'matheus.loubach@gmail.com', '1114e6af1c14bd67ce625bdc907f348653bf7fde', '2021-12-01', 0),
(78, 'aa', 'vb', 'email@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-12-01', 0),
(79, 'Pedro', 'Paulo', 'rijafi7258@simdpi.com', '55a1b02046146d34402fe09cb93b568de962bcde', '2021-12-01', 0),
(80, 'THOMAS', 'Barros', 'thomasdfoz.sp@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-12-01', 0),
(81, 'Lincoln', 'Rafael', 'lincoln.rafael1999@gmail.com', 'f5fc17f7aa345af257254427b5aa67f4b62085b0', '2021-12-01', 0),
(82, 'Simão', 'Brandão', 'sibrandao2008@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-12-01', 0),
(83, 'cuca', 'beludo', 'cucabeludo@dojoao.honesto', '601f1889667efaebb33b8c12572835da3f027f78', '2021-12-01', 2),
(84, 'Test', 'Test', 'test@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-12-01', 0),
(85, 'Joao', 'Vitor', 'joaovitor@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-12-01', 0),
(86, 'Joao', 'Oliveira', 'gw@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-12-01', 2),
(87, 'Bernardo', 'Filho', 'bernardolopes.luz@hotmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-12-01', 2),
(88, 'Teste', 'Teste', 'teste1@gmail.com', '2e6f9b0d5885b6010f9167787445617f553a735f', '2021-12-01', 0),
(89, 'Xxxxx', 'Xxxxxxxxxxx', 'xxxxxxxxddd@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-12-01', 0),
(90, 'Jjj', 'Kkk', '@.', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-12-01', 0),
(91, 'awedawe', 'awedawe', 'awedawe@gmail.com', 'c3bfef821cd6498671bbf3ccec1ed787b06d1988', '2021-12-01', 0),
(92, 'Breno', 'Nunes', 'brenonunesnogueira18@gmail.com', 'ab7ee2c7d14f4ad09588cf61906d0f8adbaad43c', '2021-12-02', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tab_carteira`
--
ALTER TABLE `tab_carteira`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carteira` (`id_usuario`);

--
-- Índices para tabela `tab_gastos`
--
ALTER TABLE `tab_gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gasto` (`id_usuario`);

--
-- Índices para tabela `tab_lucros`
--
ALTER TABLE `tab_lucros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lucro` (`id_usuario`);

--
-- Índices para tabela `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tab_carteira`
--
ALTER TABLE `tab_carteira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de tabela `tab_gastos`
--
ALTER TABLE `tab_gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de tabela `tab_lucros`
--
ALTER TABLE `tab_lucros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tab_carteira`
--
ALTER TABLE `tab_carteira`
  ADD CONSTRAINT `fk_carteira` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`);

--
-- Limitadores para a tabela `tab_gastos`
--
ALTER TABLE `tab_gastos`
  ADD CONSTRAINT `fk_gasto` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`);

--
-- Limitadores para a tabela `tab_lucros`
--
ALTER TABLE `tab_lucros`
  ADD CONSTRAINT `fk_lucro` FOREIGN KEY (`id_usuario`) REFERENCES `tab_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
