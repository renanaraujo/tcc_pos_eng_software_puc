-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2020 at 06:05 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemasaude`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamento`
--

CREATE TABLE `agendamento` (
  `Id` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `CELULA_ATENDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `USUARIO_Id` int(11) NOT NULL,
  `PROFISSIONAL_SAUDE_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agendamento_consulta`
--

CREATE TABLE `agendamento_consulta` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agendamento_exame_medico`
--

CREATE TABLE `agendamento_exame_medico` (
  `Id` int(11) NOT NULL,
  `TIPO_EXAME_MEDICO_Id` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agendamento_procedimento_medico`
--

CREATE TABLE `agendamento_procedimento_medico` (
  `Id` int(11) NOT NULL,
  `TIPO_PROCEDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `celula_atendimento_medico`
--

CREATE TABLE `celula_atendimento_medico` (
  `Id` int(11) NOT NULL,
  `LOCAL_ATENDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clinica_medica`
--

CREATE TABLE `clinica_medica` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clinica_privada`
--

CREATE TABLE `clinica_privada` (
  `Id` int(11) NOT NULL,
  `CNPJ` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clinica_publica`
--

CREATE TABLE `clinica_publica` (
  `Id` int(11) NOT NULL,
  `Inaugurada_Por` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `Id` int(11) NOT NULL,
  `PRONTUARIO_Id` int(11) NOT NULL,
  `MEDICO_Id` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consultorio`
--

CREATE TABLE `consultorio` (
  `Id` int(11) NOT NULL,
  `Exclusivo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostico`
--

CREATE TABLE `diagnostico` (
  `Id` int(11) NOT NULL,
  `PRONTUARIO_Id` int(11) NOT NULL,
  `DOENCA_Id` int(11) DEFAULT NULL,
  `Data` datetime NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doenca`
--

CREATE TABLE `doenca` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doenca_possui_tratamento`
--

CREATE TABLE `doenca_possui_tratamento` (
  `Id` int(11) NOT NULL,
  `DOENCA_Id` int(11) NOT NULL,
  `TRATAMENTO_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `especilidade_medica`
--

CREATE TABLE `especilidade_medica` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exame_medico`
--

CREATE TABLE `exame_medico` (
  `Id` int(11) NOT NULL,
  `PRONTUARIO_Id` int(11) NOT NULL,
  `TIPO_EXAME_MEDICO_Id` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `farmacia`
--

CREATE TABLE `farmacia` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `horario_trabalho_profissional_saude`
--

CREATE TABLE `horario_trabalho_profissional_saude` (
  `Id` int(11) NOT NULL,
  `PROFISSIONAL_SAUDE_Id` int(11) NOT NULL,
  `Dias_Semana` varchar(7) NOT NULL,
  `Hora_Saida` varchar(5) NOT NULL,
  `Hora_Entrada` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Id` int(11) NOT NULL,
  `Porte` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_analise_clinica`
--

CREATE TABLE `lab_analise_clinica` (
  `Id` int(11) NOT NULL,
  `Avaliacao` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leito`
--

CREATE TABLE `leito` (
  `Id` int(11) NOT NULL,
  `LOCAL_ATENDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `TIPO_LEITO_Id` int(11) NOT NULL,
  `PACIENTE_USUARIO_Id` int(11) DEFAULT NULL,
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `localizacao`
--

CREATE TABLE `localizacao` (
  `Id` int(11) NOT NULL,
  `LOCAL_ATENDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `Rua` varchar(100) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Complemento` varchar(10) DEFAULT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Cep` varchar(9) DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `local_atendimento_medico`
--

CREATE TABLE `local_atendimento_medico` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicamento`
--

CREATE TABLE `medicamento` (
  `Id` int(11) NOT NULL,
  `TIPO_MEDICAMENTO_Id` int(11) NOT NULL,
  `FARMACIA_Id` int(11) NOT NULL,
  `Validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `Id` int(11) NOT NULL,
  `ESPECILIDADE_MEDICA_Id` int(11) NOT NULL,
  `Crm` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `Id` int(11) NOT NULL,
  `Cpf` varchar(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Data_Nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`Id`, `Cpf`, `Nome`, `Data_Nascimento`) VALUES
(10, '11111111111', 'Paciente José da Silva', '1992-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `perfil_acesso`
--

CREATE TABLE `perfil_acesso` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfil_acesso`
--

INSERT INTO `perfil_acesso` (`Id`, `Nome`) VALUES
(1, 'Admin'),
(2, 'Paciente'),
(3, 'Profissional de Saúde');

-- --------------------------------------------------------

--
-- Table structure for table `ponto_vacinacao`
--

CREATE TABLE `ponto_vacinacao` (
  `Id` int(11) NOT NULL,
  `LOCAL_ATENDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `PONTO_VACINACAOcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ponto_vacinacao_vacina`
--

CREATE TABLE `ponto_vacinacao_vacina` (
  `Id` int(11) NOT NULL,
  `PONTO_VACINACAO_Id` int(11) NOT NULL,
  `VACINA_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posto_de_saude`
--

CREATE TABLE `posto_de_saude` (
  `Id` int(11) NOT NULL,
  `Aceita_Convenio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `procedimento_medico`
--

CREATE TABLE `procedimento_medico` (
  `Id` int(11) NOT NULL,
  `PRONTUARIO_Id` int(11) NOT NULL,
  `TIPO_PROCEDIMENTO_MEDICO_Id` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profissional_saude`
--

CREATE TABLE `profissional_saude` (
  `Id` int(11) NOT NULL,
  `TIPO_CARGO_PROFISSIONAL_SAUDE_Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cpf` varchar(11) NOT NULL,
  `Data_Nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profissional_saude`
--

INSERT INTO `profissional_saude` (`Id`, `TIPO_CARGO_PROFISSIONAL_SAUDE_Id`, `Nome`, `Cpf`, `Data_Nascimento`) VALUES
(14, 1, 'Enfermeiro Joaquim Santos', '33333333333', '1991-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `prontuario`
--

CREATE TABLE `prontuario` (
  `Id` int(11) NOT NULL,
  `PACIENTE_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cargo_profissional_saude`
--

CREATE TABLE `tipo_cargo_profissional_saude` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_cargo_profissional_saude`
--

INSERT INTO `tipo_cargo_profissional_saude` (`Id`, `Nome`) VALUES
(1, 'Enfermeiro'),
(2, 'Operador de raio X');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_exame_medico`
--

CREATE TABLE `tipo_exame_medico` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_exame_medico`
--

INSERT INTO `tipo_exame_medico` (`Id`, `Nome`, `Descricao`) VALUES
(2, 'Ultrassom abdominal', 'Descrição do ultrassom abdominal'),
(3, 'Exame de sangue', 'Detalhes do exame de sangue');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_leito`
--

CREATE TABLE `tipo_leito` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_medicamento`
--

CREATE TABLE `tipo_medicamento` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_procedimento_medico`
--

CREATE TABLE `tipo_procedimento_medico` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_procedimento_medico`
--

INSERT INTO `tipo_procedimento_medico` (`Id`, `Nome`, `Descricao`) VALUES
(1, 'Aplicação de insulina', 'Descrição da aplicação de insulina'),
(2, 'Aplicação de soro fisiológico', 'Descrição da aplicação de soro fisiológico');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_vacina`
--

CREATE TABLE `tipo_vacina` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tratamento`
--

CREATE TABLE `tratamento` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  `TIPO_MEDICAMENTO_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `PERFIL_ACESSO_Id` int(11) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `PERFIL_ACESSO_Id`, `Login`, `Senha`, `Email`) VALUES
(10, 2, 'paciente', 'paciente', 'emailpaciente@gmail.com'),
(11, 1, 'admin', 'admin', 'admin@gmail.com'),
(14, 3, 'enfermeiro', 'enfermeiro', 'enfermeiro@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vacina`
--

CREATE TABLE `vacina` (
  `Id` int(11) NOT NULL,
  `TIPO_VACINA_Id` int(11) NOT NULL,
  `Validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vacina_aplicada`
--

CREATE TABLE `vacina_aplicada` (
  `Id` int(11) NOT NULL,
  `VACINA_Id` int(11) NOT NULL,
  `PRONTUARIO_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vacina_previne_doenca`
--

CREATE TABLE `vacina_previne_doenca` (
  `Id` int(11) NOT NULL,
  `VACINA_Id` int(11) NOT NULL,
  `DOENCA_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_AGENDAMENTO_CELULA_ATENDIMENTO_MEDICO1_idx` (`CELULA_ATENDIMENTO_MEDICO_Id`),
  ADD KEY `fk_AGENDAMENTO_USUARIO1_idx` (`USUARIO_Id`),
  ADD KEY `fk_AGENDAMENTO_PROFISSIONAL_SAUDE1_idx` (`PROFISSIONAL_SAUDE_Id`);

--
-- Indexes for table `agendamento_consulta`
--
ALTER TABLE `agendamento_consulta`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `agendamento_exame_medico`
--
ALTER TABLE `agendamento_exame_medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_AGENDAMENTO_EXAME_MEDICO_TIPO_EXAME_MEDICO1_idx` (`TIPO_EXAME_MEDICO_Id`);

--
-- Indexes for table `agendamento_procedimento_medico`
--
ALTER TABLE `agendamento_procedimento_medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_AGENDAMENTO_PROCEDIMENTO_MEDICO_TIPO_PROCEDIMENTO_MEDICO_idx` (`TIPO_PROCEDIMENTO_MEDICO_Id`);

--
-- Indexes for table `celula_atendimento_medico`
--
ALTER TABLE `celula_atendimento_medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_CELULA_ATENDIMENTO_MEDICO_LOCAL_ATENDIMENTO_MEDICO1_idx` (`LOCAL_ATENDIMENTO_MEDICO_Id`);

--
-- Indexes for table `clinica_medica`
--
ALTER TABLE `clinica_medica`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_CLINICA_MEDICA_LOCAL_ATENDIMENTO_MEDICO_idx` (`Id`);

--
-- Indexes for table `clinica_privada`
--
ALTER TABLE `clinica_privada`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_CLINICA_PRIVADA_CLINICA_MEDICA1_idx` (`Id`);

--
-- Indexes for table `clinica_publica`
--
ALTER TABLE `clinica_publica`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_CLINICA_PUBLICA_CLINICA_MEDICA1_idx` (`Id`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_CONSULTA_MEDICO1_idx` (`MEDICO_Id`),
  ADD KEY `fk_CONSULTA_PRONTUARIO1_idx` (`PRONTUARIO_Id`);

--
-- Indexes for table `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_HOSPITAL_LOCAL_ATENDIMENTO_MEDICO1_idx` (`Id`);

--
-- Indexes for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_DIAGNOSTICO_DOENCA1_idx` (`DOENCA_Id`),
  ADD KEY `fk_DIAGNOSTICO_PRONTUARIO1_idx` (`PRONTUARIO_Id`);

--
-- Indexes for table `doenca`
--
ALTER TABLE `doenca`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `doenca_possui_tratamento`
--
ALTER TABLE `doenca_possui_tratamento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_DOENCA_POSSUI_TRATAMENTO_DOENCA1_idx` (`DOENCA_Id`),
  ADD KEY `fk_DOENCA_POSSUI_TRATAMENTO_TRATAMENTO1_idx` (`TRATAMENTO_Id`);

--
-- Indexes for table `especilidade_medica`
--
ALTER TABLE `especilidade_medica`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `exame_medico`
--
ALTER TABLE `exame_medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_EXAME_PRONTUARIO1_idx` (`PRONTUARIO_Id`),
  ADD KEY `fk_EXAME_MEDICO_TIPO_EXAME_MEDICO1_idx` (`TIPO_EXAME_MEDICO_Id`);

--
-- Indexes for table `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `horario_trabalho_profissional_saude`
--
ALTER TABLE `horario_trabalho_profissional_saude`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_HORARIO_TRABALHO_PROFISSIONAL_SAUDE_PROFISSIONAL_SAUDE1_idx` (`PROFISSIONAL_SAUDE_Id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_HOSPITAL_LOCAL_ATENDIMENTO_MEDICO1_idx` (`Id`);

--
-- Indexes for table `lab_analise_clinica`
--
ALTER TABLE `lab_analise_clinica`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_HOSPITAL_LOCAL_ATENDIMENTO_MEDICO1_idx` (`Id`);

--
-- Indexes for table `leito`
--
ALTER TABLE `leito`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_LEITO_LOCAL_ATENDIMENTO_MEDICO1_idx` (`LOCAL_ATENDIMENTO_MEDICO_Id`),
  ADD KEY `fk_LEITO_TIPO_LEITO1_idx` (`TIPO_LEITO_Id`),
  ADD KEY `fk_LEITO_PACIENTE1_idx` (`PACIENTE_USUARIO_Id`);

--
-- Indexes for table `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_LOCALIZACAO_LOCAL_ATENDIMENTO_MEDICO1_idx` (`LOCAL_ATENDIMENTO_MEDICO_Id`);

--
-- Indexes for table `local_atendimento_medico`
--
ALTER TABLE `local_atendimento_medico`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_MEDICAMENTO_TIPO_MEDICAMENTO1_idx` (`TIPO_MEDICAMENTO_Id`),
  ADD KEY `fk_MEDICAMENTO_FARMACIA1_idx` (`FARMACIA_Id`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_MEDICO_ESPECILIDADE_MEDICA1_idx` (`ESPECILIDADE_MEDICA_Id`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `perfil_acesso`
--
ALTER TABLE `perfil_acesso`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ponto_vacinacao`
--
ALTER TABLE `ponto_vacinacao`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_PONTO_VACINACAO_LOCAL_ATENDIMENTO_MEDICO1_idx` (`LOCAL_ATENDIMENTO_MEDICO_Id`);

--
-- Indexes for table `ponto_vacinacao_vacina`
--
ALTER TABLE `ponto_vacinacao_vacina`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_PONTO_VACINACAO_VACINA_PONTO_VACINACAO1_idx` (`PONTO_VACINACAO_Id`),
  ADD KEY `fk_PONTO_VACINACAO_VACINA_VACINA1_idx` (`VACINA_Id`);

--
-- Indexes for table `posto_de_saude`
--
ALTER TABLE `posto_de_saude`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id_UNIQUE` (`Id`),
  ADD KEY `fk_HOSPITAL_LOCAL_ATENDIMENTO_MEDICO1_idx` (`Id`);

--
-- Indexes for table `procedimento_medico`
--
ALTER TABLE `procedimento_medico`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_PROCEDIMENTO_MEDICO_PRONTUARIO1_idx` (`PRONTUARIO_Id`),
  ADD KEY `fk_PROCEDIMENTO_MEDICO_TIPO_PROCEDIMENTO_MEDICO1_idx` (`TIPO_PROCEDIMENTO_MEDICO_Id`);

--
-- Indexes for table `profissional_saude`
--
ALTER TABLE `profissional_saude`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_PROFISSIONAL_SAUDE_TIPO_CARGO_PROFISSIONAL_SAUDE1_idx` (`TIPO_CARGO_PROFISSIONAL_SAUDE_Id`);

--
-- Indexes for table `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_PRONTUARIO_PACIENTE1_idx` (`PACIENTE_Id`);

--
-- Indexes for table `tipo_cargo_profissional_saude`
--
ALTER TABLE `tipo_cargo_profissional_saude`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_exame_medico`
--
ALTER TABLE `tipo_exame_medico`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_leito`
--
ALTER TABLE `tipo_leito`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_medicamento`
--
ALTER TABLE `tipo_medicamento`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_procedimento_medico`
--
ALTER TABLE `tipo_procedimento_medico`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_vacina`
--
ALTER TABLE `tipo_vacina`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tratamento`
--
ALTER TABLE `tratamento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_TRATAMENTO_TIPO_MEDICAMENTO1_idx` (`TIPO_MEDICAMENTO_Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_USUARIO_PERFIL_ACESSO1_idx` (`PERFIL_ACESSO_Id`);

--
-- Indexes for table `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_VACINA_TIPO_VACINA1_idx` (`TIPO_VACINA_Id`);

--
-- Indexes for table `vacina_aplicada`
--
ALTER TABLE `vacina_aplicada`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_VACINA_PACIENTE_VACINA1_idx` (`VACINA_Id`),
  ADD KEY `fk_VACINA_APLICADA_PRONTUARIO1_idx` (`PRONTUARIO_Id`);

--
-- Indexes for table `vacina_previne_doenca`
--
ALTER TABLE `vacina_previne_doenca`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_VACINA_PREVINE_DOENCA_VACINA1_idx` (`VACINA_Id`),
  ADD KEY `fk_VACINA_PREVINE_DOENCA_DOENCA1_idx` (`DOENCA_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agendamento_procedimento_medico`
--
ALTER TABLE `agendamento_procedimento_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `celula_atendimento_medico`
--
ALTER TABLE `celula_atendimento_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doenca`
--
ALTER TABLE `doenca`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doenca_possui_tratamento`
--
ALTER TABLE `doenca_possui_tratamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especilidade_medica`
--
ALTER TABLE `especilidade_medica`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exame_medico`
--
ALTER TABLE `exame_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horario_trabalho_profissional_saude`
--
ALTER TABLE `horario_trabalho_profissional_saude`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leito`
--
ALTER TABLE `leito`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_atendimento_medico`
--
ALTER TABLE `local_atendimento_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perfil_acesso`
--
ALTER TABLE `perfil_acesso`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ponto_vacinacao`
--
ALTER TABLE `ponto_vacinacao`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ponto_vacinacao_vacina`
--
ALTER TABLE `ponto_vacinacao_vacina`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedimento_medico`
--
ALTER TABLE `procedimento_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prontuario`
--
ALTER TABLE `prontuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_cargo_profissional_saude`
--
ALTER TABLE `tipo_cargo_profissional_saude`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_exame_medico`
--
ALTER TABLE `tipo_exame_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_leito`
--
ALTER TABLE `tipo_leito`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_medicamento`
--
ALTER TABLE `tipo_medicamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_procedimento_medico`
--
ALTER TABLE `tipo_procedimento_medico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_vacina`
--
ALTER TABLE `tipo_vacina`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tratamento`
--
ALTER TABLE `tratamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vacina`
--
ALTER TABLE `vacina`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacina_aplicada`
--
ALTER TABLE `vacina_aplicada`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacina_previne_doenca`
--
ALTER TABLE `vacina_previne_doenca`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk_AGENDAMENTO_CELULA_ATENDIMENTO_MEDICO1` FOREIGN KEY (`CELULA_ATENDIMENTO_MEDICO_Id`) REFERENCES `celula_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AGENDAMENTO_PROFISSIONAL_SAUDE1` FOREIGN KEY (`PROFISSIONAL_SAUDE_Id`) REFERENCES `profissional_saude` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AGENDAMENTO_USUARIO1` FOREIGN KEY (`USUARIO_Id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agendamento_consulta`
--
ALTER TABLE `agendamento_consulta`
  ADD CONSTRAINT `fk_AGENDAMENTO_CONSULTA_AGENDAMENTO1` FOREIGN KEY (`Id`) REFERENCES `agendamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agendamento_exame_medico`
--
ALTER TABLE `agendamento_exame_medico`
  ADD CONSTRAINT `fk_AGENDAMENTO_EXAME_MEDICO_AGENDAMENTO1` FOREIGN KEY (`Id`) REFERENCES `agendamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AGENDAMENTO_EXAME_MEDICO_TIPO_EXAME_MEDICO1` FOREIGN KEY (`TIPO_EXAME_MEDICO_Id`) REFERENCES `tipo_exame_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agendamento_procedimento_medico`
--
ALTER TABLE `agendamento_procedimento_medico`
  ADD CONSTRAINT `fk_AGENDAMENTO_PROCEDIMENTO_MEDICO_AGENDAMENTO1` FOREIGN KEY (`Id`) REFERENCES `agendamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AGENDAMENTO_PROCEDIMENTO_MEDICO_TIPO_PROCEDIMENTO_MEDICO1` FOREIGN KEY (`TIPO_PROCEDIMENTO_MEDICO_Id`) REFERENCES `tipo_procedimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `celula_atendimento_medico`
--
ALTER TABLE `celula_atendimento_medico`
  ADD CONSTRAINT `fk_CELULA_ATENDIMENTO_MEDICO_LOCAL_ATENDIMENTO_MEDICO1` FOREIGN KEY (`LOCAL_ATENDIMENTO_MEDICO_Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clinica_medica`
--
ALTER TABLE `clinica_medica`
  ADD CONSTRAINT `fk_CLINICA_MEDICA_LOCAL_ATENDIMENTO_MEDICO` FOREIGN KEY (`Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clinica_privada`
--
ALTER TABLE `clinica_privada`
  ADD CONSTRAINT `fk_CLINICA_PRIVADA_CLINICA_MEDICA` FOREIGN KEY (`Id`) REFERENCES `clinica_medica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clinica_publica`
--
ALTER TABLE `clinica_publica`
  ADD CONSTRAINT `fk_CLINICA_PUBLICA_CLINICA_MEDICA` FOREIGN KEY (`Id`) REFERENCES `clinica_medica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_CONSULTA_MEDICO1` FOREIGN KEY (`MEDICO_Id`) REFERENCES `medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CONSULTA_PRONTUARIO1` FOREIGN KEY (`PRONTUARIO_Id`) REFERENCES `prontuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `consultorio`
--
ALTER TABLE `consultorio`
  ADD CONSTRAINT `fk_CONSULTORIO_LOCAL_ATENDIMENTO_MEDICO` FOREIGN KEY (`Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `fk_DIAGNOSTICO_DOENCA1` FOREIGN KEY (`DOENCA_Id`) REFERENCES `doenca` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DIAGNOSTICO_PRONTUARIO1` FOREIGN KEY (`PRONTUARIO_Id`) REFERENCES `prontuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doenca_possui_tratamento`
--
ALTER TABLE `doenca_possui_tratamento`
  ADD CONSTRAINT `fk_DOENCA_POSSUI_TRATAMENTO_DOENCA1` FOREIGN KEY (`DOENCA_Id`) REFERENCES `doenca` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DOENCA_POSSUI_TRATAMENTO_TRATAMENTO1` FOREIGN KEY (`TRATAMENTO_Id`) REFERENCES `tratamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exame_medico`
--
ALTER TABLE `exame_medico`
  ADD CONSTRAINT `fk_EXAME_MEDICO_TIPO_EXAME_MEDICO1` FOREIGN KEY (`TIPO_EXAME_MEDICO_Id`) REFERENCES `tipo_exame_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EXAME_PRONTUARIO1` FOREIGN KEY (`PRONTUARIO_Id`) REFERENCES `prontuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `horario_trabalho_profissional_saude`
--
ALTER TABLE `horario_trabalho_profissional_saude`
  ADD CONSTRAINT `fk_HORARIO_TRABALHO_PROFISSIONAL_SAUDE_PROFISSIONAL_SAUDE1` FOREIGN KEY (`PROFISSIONAL_SAUDE_Id`) REFERENCES `profissional_saude` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `fk_HOSPITAL_LOCAL_ATENDIMENTO_MEDICO` FOREIGN KEY (`Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lab_analise_clinica`
--
ALTER TABLE `lab_analise_clinica`
  ADD CONSTRAINT `fk_LAB_ANALISE_CLINICA_LOCAL_ATENDIMENTO_MEDICO` FOREIGN KEY (`Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `leito`
--
ALTER TABLE `leito`
  ADD CONSTRAINT `fk_LEITO_LOCAL_ATENDIMENTO_MEDICO1` FOREIGN KEY (`LOCAL_ATENDIMENTO_MEDICO_Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LEITO_PACIENTE1` FOREIGN KEY (`PACIENTE_USUARIO_Id`) REFERENCES `paciente` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LEITO_TIPO_LEITO1` FOREIGN KEY (`TIPO_LEITO_Id`) REFERENCES `tipo_leito` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `localizacao`
--
ALTER TABLE `localizacao`
  ADD CONSTRAINT `fk_LOCALIZACAO_LOCAL_ATENDIMENTO_MEDICO1` FOREIGN KEY (`LOCAL_ATENDIMENTO_MEDICO_Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `fk_MEDICAMENTO_FARMACIA1` FOREIGN KEY (`FARMACIA_Id`) REFERENCES `farmacia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MEDICAMENTO_TIPO_MEDICAMENTO1` FOREIGN KEY (`TIPO_MEDICAMENTO_Id`) REFERENCES `tipo_medicamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_MEDICO_ESPECILIDADE_MEDICA1` FOREIGN KEY (`ESPECILIDADE_MEDICA_Id`) REFERENCES `especilidade_medica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MEDICO_PROFISSIONAL_SAUDE1` FOREIGN KEY (`Id`) REFERENCES `profissional_saude` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_PACIENTE_USUARIO1` FOREIGN KEY (`Id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ponto_vacinacao`
--
ALTER TABLE `ponto_vacinacao`
  ADD CONSTRAINT `fk_PONTO_VACINACAO_LOCAL_ATENDIMENTO_MEDICO1` FOREIGN KEY (`LOCAL_ATENDIMENTO_MEDICO_Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ponto_vacinacao_vacina`
--
ALTER TABLE `ponto_vacinacao_vacina`
  ADD CONSTRAINT `fk_PONTO_VACINACAO_VACINA_PONTO_VACINACAO1` FOREIGN KEY (`PONTO_VACINACAO_Id`) REFERENCES `ponto_vacinacao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PONTO_VACINACAO_VACINA_VACINA1` FOREIGN KEY (`VACINA_Id`) REFERENCES `vacina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posto_de_saude`
--
ALTER TABLE `posto_de_saude`
  ADD CONSTRAINT `fk_POSTO_DE_SAUDE_LOCAL_ATENDIMENTO_MEDICO` FOREIGN KEY (`Id`) REFERENCES `local_atendimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `procedimento_medico`
--
ALTER TABLE `procedimento_medico`
  ADD CONSTRAINT `fk_PROCEDIMENTO_MEDICO_PRONTUARIO1` FOREIGN KEY (`PRONTUARIO_Id`) REFERENCES `prontuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PROCEDIMENTO_MEDICO_TIPO_PROCEDIMENTO_MEDICO1` FOREIGN KEY (`TIPO_PROCEDIMENTO_MEDICO_Id`) REFERENCES `tipo_procedimento_medico` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profissional_saude`
--
ALTER TABLE `profissional_saude`
  ADD CONSTRAINT `fk_PROFISSIONAL_SAUDE_TIPO_CARGO_PROFISSIONAL_SAUDE1` FOREIGN KEY (`TIPO_CARGO_PROFISSIONAL_SAUDE_Id`) REFERENCES `tipo_cargo_profissional_saude` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PROFISSIONAL_SAUDE_USUARIO1` FOREIGN KEY (`Id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `fk_PRONTUARIO_PACIENTE1` FOREIGN KEY (`PACIENTE_Id`) REFERENCES `paciente` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tratamento`
--
ALTER TABLE `tratamento`
  ADD CONSTRAINT `fk_TRATAMENTO_TIPO_MEDICAMENTO1` FOREIGN KEY (`TIPO_MEDICAMENTO_Id`) REFERENCES `tipo_medicamento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_PERFIL_ACESSO1` FOREIGN KEY (`PERFIL_ACESSO_Id`) REFERENCES `perfil_acesso` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vacina`
--
ALTER TABLE `vacina`
  ADD CONSTRAINT `fk_VACINA_TIPO_VACINA1` FOREIGN KEY (`TIPO_VACINA_Id`) REFERENCES `tipo_vacina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vacina_aplicada`
--
ALTER TABLE `vacina_aplicada`
  ADD CONSTRAINT `fk_VACINA_APLICADA_PRONTUARIO1` FOREIGN KEY (`PRONTUARIO_Id`) REFERENCES `prontuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VACINA_PACIENTE_VACINA1` FOREIGN KEY (`VACINA_Id`) REFERENCES `vacina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vacina_previne_doenca`
--
ALTER TABLE `vacina_previne_doenca`
  ADD CONSTRAINT `fk_VACINA_PREVINE_DOENCA_DOENCA1` FOREIGN KEY (`DOENCA_Id`) REFERENCES `doenca` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VACINA_PREVINE_DOENCA_VACINA1` FOREIGN KEY (`VACINA_Id`) REFERENCES `vacina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
