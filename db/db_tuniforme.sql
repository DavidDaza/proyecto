-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2016 a las 22:40:38
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tuniforme`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario` (IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `direc` VARCHAR(45), IN `pass` VARCHAR(50), IN `email` VARCHAR(45))  BEGIN
UPDATE usuario 
set Nombre1=nom1, Nombre2=nom2,Apellido1=ape1,Apellido2=ape2,Direccion=direc,Contraseña=pass
WHERE Correo = email;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticacionAdmin` (`email` VARCHAR(45), IN `pass` VARCHAR(45), IN `roll` INT)  BEGIN
select* from usuario where correo=email and contraseña=pass and Id_rol=roll;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticacionUsu` (IN `email` VARCHAR(45), IN `pass` VARCHAR(60))  BEGIN
select *
from usuario
where  Correo = email and Contraseña= pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `datosObjUsuario` (`email` VARCHAR(45))  BEGIN
select * from usuario where correo = email;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `tpdoc` INT, IN `roll` INT, IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `doc` VARCHAR(20), IN `email` VARCHAR(45), IN `direc` VARCHAR(45), IN `pass` VARCHAR(60))  BEGIN
insert into usuario(Id_tipodocumento,Id_rol,Nombre1,Nombre2,Apellido1, Apellido2,Documento, Correo,Direccion,Contraseña) 
values(roll,tpdoc,nom1,nom2,ape1,ape2,doc,email,direc,pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar` (IN `rol` INT)  BEGIN
select concat(nombre1,' ',nombre2)Nombres,concat( apellido1 ,' ',apellido2)Apellidos, Correo,Documento,Direccion
from usuario
where Id_rol=rol;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `Id_Abono` int(11) NOT NULL,
  `Id_Pedido` int(11) DEFAULT NULL,
  `Id_FormaPago` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedidotalla`
--

CREATE TABLE `estadopedidotalla` (
  `Id_EstadoPedidoTalla` int(11) NOT NULL,
  `Descr_PedidoTalla` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `Id_EstadoPedido` int(11) NOT NULL,
  `EnProceso` varchar(15) DEFAULT NULL,
  `Entregado` varchar(15) DEFAULT NULL,
  `Cotizacion` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `Id_FormaPago` int(11) NOT NULL,
  `Contado` varchar(20) DEFAULT NULL,
  `Credito` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `Id_Novedad` int(11) NOT NULL,
  `Id_Pedido` int(11) DEFAULT NULL,
  `Id_TipoNovedad` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioIncremento` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Id_EstadoPedido` int(11) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Direccion_Entrega` varchar(25) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_talla`
--

CREATE TABLE `pedido_talla` (
  `Id_PedidoTalla` int(11) NOT NULL,
  `Id_Pedido` int(11) DEFAULT NULL,
  `Id_Talla` int(11) DEFAULT NULL,
  `Id_EstadoPedidoTalla` int(11) DEFAULT NULL,
  `Id_Intitucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda`
--

CREATE TABLE `prenda` (
  `Id_Prenda` int(11) NOT NULL,
  `Url_Diseño` varchar(200) DEFAULT NULL,
  `Nombre_Prenda` varchar(50) DEFAULT NULL,
  `Descripcion_Prenda` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda_uniforme_institucion`
--

CREATE TABLE `prenda_uniforme_institucion` (
  `Id_Institucion` int(11) NOT NULL,
  `Id_Uniforme` int(11) DEFAULT NULL,
  `Id_Prenda` int(11) DEFAULT NULL,
  `Activo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_rol` int(11) NOT NULL,
  `Tipo_rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_rol`, `Tipo_rol`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `Id_Talla` int(11) NOT NULL,
  `Id_Prenda` int(11) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Id_tipodocumento` int(11) NOT NULL,
  `Tipo_doc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`Id_tipodocumento`, `Tipo_doc`) VALUES
(1, 'Cédula de Ciudadanía (CC)'),
(2, 'Tarjeta de Identidad (TI)'),
(3, 'Cédula de Extranjería (CE)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_novedad`
--

CREATE TABLE `tipo_novedad` (
  `Id_TipoNovedad` int(11) NOT NULL,
  `Tipo_Novedad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_talla`
--

CREATE TABLE `tipo_talla` (
  `Id_TipoTalla` int(11) NOT NULL,
  `Id_Prenda` int(11) DEFAULT NULL,
  `Id_Talla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniforme`
--

CREATE TABLE `uniforme` (
  `Id_Uniforme` int(11) NOT NULL,
  `TipoUniforme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Id_tipodocumento` int(11) DEFAULT NULL,
  `Id_rol` int(11) DEFAULT NULL,
  `Nombre1` varchar(30) DEFAULT NULL,
  `Nombre2` varchar(30) DEFAULT NULL,
  `Apellido1` varchar(30) DEFAULT NULL,
  `Apellido2` varchar(30) DEFAULT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Id_tipodocumento`, `Id_rol`, `Nombre1`, `Nombre2`, `Apellido1`, `Apellido2`, `Documento`, `Correo`, `Direccion`, `Contraseña`) VALUES
(1, 1, 1, 'David D', 'Andres', 'Daza', 'Diaz', '1026580077', '', 'Calle falsa 1234', '6886badb36b23129002bbbae0d9432d0'),
(3, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'david@da.da', 'Crea 105 n°154a-36', '6886badb36b23129002bbbae0d9432d0'),
(4, 1, 1, 'Dav', 'Andres', 'Daza', 'Diaz', '1026580077', 'david.d.08@h', 'Crea 105 n°154a-36', '6886badb36b23129002bbbae0d9432d0'),
(5, 1, 1, 'Pompilio', 'Rocas', 'Daza', 'Diaz', '1026580077', 'david.d.08@hoo', 'Crea 105 n°154a-36', '6886badb36b23129002bbbae0d9432d0'),
(6, 1, 1, 'Pedro', 'Nose', 'Daza', 'Diaz', '1026580077', 'david.d.08@hooo', 'Crea 105 n°154a-36', '202cb962ac59075b964b07152d234b70'),
(68, 2, 2, 'DavidAdmin', 'Andres', 'Daza', 'Diaz', '66666661111', 'admin@admin.co', 'Calle Falsa', '7b430fcde10f344b3421d946f03f765a'),
(70, 3, 1, 'David', '', 'Andres', '', '123456789', 'user@user.co', 'Calle falsa 123 n22', '7b430fcde10f344b3421d946f03f765a');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`Id_Abono`),
  ADD KEY `FK_AbonoPedido` (`Id_Pedido`),
  ADD KEY `FK_AbonoFormaPago` (`Id_FormaPago`);

--
-- Indices de la tabla `estadopedidotalla`
--
ALTER TABLE `estadopedidotalla`
  ADD PRIMARY KEY (`Id_EstadoPedidoTalla`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`Id_EstadoPedido`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`Id_FormaPago`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`Id_Novedad`),
  ADD KEY `FK_NovedadPedido` (`Id_Pedido`),
  ADD KEY `FK_NovedadTipoNovedad` (`Id_TipoNovedad`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `FK_PedidoUsuario` (`Id_Usuario`),
  ADD KEY `FK_PedidoEstadoPedido` (`Id_EstadoPedido`);

--
-- Indices de la tabla `pedido_talla`
--
ALTER TABLE `pedido_talla`
  ADD PRIMARY KEY (`Id_PedidoTalla`),
  ADD KEY `FK_PedidoTalla` (`Id_Pedido`),
  ADD KEY `FK_PedidoTallaTalla` (`Id_Talla`),
  ADD KEY `FK_PedidoTallaEstadoPedidoTalla` (`Id_EstadoPedidoTalla`);

--
-- Indices de la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD PRIMARY KEY (`Id_Prenda`);

--
-- Indices de la tabla `prenda_uniforme_institucion`
--
ALTER TABLE `prenda_uniforme_institucion`
  ADD PRIMARY KEY (`Id_Institucion`),
  ADD KEY `FK_PrendaUniformeInstitucionPrenda` (`Id_Prenda`),
  ADD KEY `FK_PrendaUniformeInstitucion` (`Id_Uniforme`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`Id_Talla`),
  ADD KEY `FK_TallaPrenda` (`Id_Prenda`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Id_tipodocumento`);

--
-- Indices de la tabla `tipo_novedad`
--
ALTER TABLE `tipo_novedad`
  ADD PRIMARY KEY (`Id_TipoNovedad`);

--
-- Indices de la tabla `tipo_talla`
--
ALTER TABLE `tipo_talla`
  ADD PRIMARY KEY (`Id_TipoTalla`),
  ADD KEY `FK_TipoTalla` (`Id_Talla`);

--
-- Indices de la tabla `uniforme`
--
ALTER TABLE `uniforme`
  ADD PRIMARY KEY (`Id_Uniforme`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `email` (`Correo`),
  ADD KEY `FK_UsuarioTipoDocumento` (`Id_tipodocumento`),
  ADD KEY `FK_UsuarioRol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `FK_AbonoFormaPago` FOREIGN KEY (`Id_FormaPago`) REFERENCES `forma_pago` (`Id_FormaPago`),
  ADD CONSTRAINT `FK_AbonoPedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`);

--
-- Filtros para la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD CONSTRAINT `FK_NovedadPedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`),
  ADD CONSTRAINT `FK_NovedadTipoNovedad` FOREIGN KEY (`Id_TipoNovedad`) REFERENCES `tipo_novedad` (`Id_TipoNovedad`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PedidoEstadoPedido` FOREIGN KEY (`Id_EstadoPedido`) REFERENCES `estado_pedido` (`Id_EstadoPedido`),
  ADD CONSTRAINT `FK_PedidoUsuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `pedido_talla`
--
ALTER TABLE `pedido_talla`
  ADD CONSTRAINT `FK_PedidoTalla` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`),
  ADD CONSTRAINT `FK_PedidoTallaEstadoPedidoTalla` FOREIGN KEY (`Id_EstadoPedidoTalla`) REFERENCES `estadopedidotalla` (`Id_EstadoPedidoTalla`),
  ADD CONSTRAINT `FK_PedidoTallaTalla` FOREIGN KEY (`Id_Talla`) REFERENCES `talla` (`Id_Talla`);

--
-- Filtros para la tabla `prenda_uniforme_institucion`
--
ALTER TABLE `prenda_uniforme_institucion`
  ADD CONSTRAINT `FK_PrendaUniformeInstitucion` FOREIGN KEY (`Id_Uniforme`) REFERENCES `uniforme` (`Id_Uniforme`),
  ADD CONSTRAINT `FK_PrendaUniformeInstitucionPrenda` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`);

--
-- Filtros para la tabla `talla`
--
ALTER TABLE `talla`
  ADD CONSTRAINT `FK_TallaPrenda` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`);

--
-- Filtros para la tabla `tipo_talla`
--
ALTER TABLE `tipo_talla`
  ADD CONSTRAINT `FK_TipoTalla` FOREIGN KEY (`Id_Talla`) REFERENCES `talla` (`Id_Talla`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_UsuarioRol` FOREIGN KEY (`Id_rol`) REFERENCES `rol` (`Id_rol`),
  ADD CONSTRAINT `FK_UsuarioTipoDocumento` FOREIGN KEY (`Id_tipodocumento`) REFERENCES `tipo_documento` (`Id_tipodocumento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;