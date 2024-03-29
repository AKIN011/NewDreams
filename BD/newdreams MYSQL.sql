-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2024 a las 04:12:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `newdreams`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ADMINISTRADOR` (IN `p_idAdministrador` INT)   BEGIN
    DELETE FROM Administrador
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CLIENTE` (IN `p_idCliente` CHAR(5))   BEGIN
    DELETE FROM Cliente
    WHERE idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5))   BEGIN
    DELETE FROM Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COTIZANCION` (IN `p_No_Cotizacion` CHAR(7))   BEGIN
    DELETE FROM Cotización
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45))   BEGIN
    DELETE FROM Cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ENCUESTA` (IN `p_idEncuesta` INT)   BEGIN
    DELETE FROM Encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_EVENTO` (IN `p_idEvento` INT)   BEGIN
    DELETE FROM Evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PAGOS` (IN `p_No_Pagos` CHAR(5))   BEGIN
    DELETE FROM Pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SERVICIO` (IN `p_idServicio` CHAR(4))   BEGIN
    DELETE FROM Servicio
    WHERE idServicio = p_idServicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ADMINISTRADOR` (IN `p_idAdministrador` INT, IN `p_Correo_Admin` VARCHAR(45), IN `p_Contraseña_admin` VARCHAR(45))   BEGIN
    INSERT INTO Administrador (idAdministrador, Correo_Admin, Contraseña_admin)
    VALUES (p_idAdministrador, p_Correo_Admin, p_Contraseña_admin);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_CLIENTE` (IN `p_Contraseña_Cliente` VARCHAR(45), IN `p_Correo_cotizante` VARCHAR(45))   BEGIN
    INSERT INTO Cliente (Contraseña_Cliente, Correo_cotizante)
    VALUES (p_Contraseña_Cliente, p_Correo_cotizante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5), IN `p_Fecha_hora_comprobante` DATETIME, IN `p_Valor_Comprobante` INT, IN `p_Pagos_No_Pagos` CHAR(5), IN `p_Pagos_Evento_idEvento` INT, IN `p_Pagos_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Comprobante (No_Comprobante, Fecha_hora_comprobante, Valor_Comprobante, Pagos_No_Pagos, Pagos_Evento_idEvento, Pagos_Evento_Cliente_idCliente)
    VALUES (p_No_Comprobante, p_Fecha_hora_comprobante, p_Valor_Comprobante, p_Pagos_No_Pagos, p_Pagos_Evento_idEvento, p_Pagos_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COTIZACION` (IN `p_No_Cotizacion` CHAR(7), IN `p_Ubicacion` VARCHAR(45), IN `p_Fecha_Parcial_Evento_Cotizacion` DATETIME, IN `p_Fecha_Hora_Cotizacion` DATETIME, IN `p_Valor_Cotizacion` INT, IN `p_Cantidad_Personas_Cotizacion` SMALLINT, IN `p_Cotizante_Correo` VARCHAR(45))   BEGIN
    INSERT INTO Cotización (No_Cotizacion, Ubicacion, Fecha_Parcial_Evento_Cotización, Fecha_Hora_Cotizacion, Valor_Cotización, Cantidad_Personas_Cotización, Cotizante_Correo)
    VALUES (p_No_Cotizacion, p_Ubicacion, p_Fecha_Parcial_Evento_Cotizacion, p_Fecha_Hora_Cotizacion, p_Valor_Cotizacion, p_Cantidad_Personas_Cotizacion, p_Cotizante_Correo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45), IN `p_Nombre_Cotizante` VARCHAR(45), IN `p_Apellido_Cotizante` VARCHAR(45), IN `p_Telefono_Cotizante` VARCHAR(45))   BEGIN
    INSERT INTO Cotizante (Correo_Cotizante, Nombre_Cotizante, Apellido_Cotizante, Telefono_Cotizante)
    VALUES (p_Correo_Cotizante, p_Nombre_Cotizante, p_Apellido_Cotizante, p_Telefono_Cotizante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ENCUESTA` (IN `p_idEncuesta` INT, IN `p_Correo_Encuesta` VARCHAR(45), IN `p_Nombre_encuesta` VARCHAR(45), IN `p_Tipo_evento_encuesta` VARCHAR(45), IN `p_Satisfaccion_encuesta` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Encuesta (idEncuesta, Correo_Encuesta, Nombre_encuesta, Tipo_evento_encuesta, Satisfaccion_encuesta, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_idEncuesta, p_Correo_Encuesta, p_Nombre_encuesta, p_Tipo_evento_encuesta, p_Satisfaccion_encuesta, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EVENTO` (IN `p_Tipo_evento` VARCHAR(45), IN `p_Valor_evento` INT, IN `p_Fecha_evento` DATETIME, IN `p_Estado_evento` VARCHAR(45), IN `p_Tematica_evento` VARCHAR(45), IN `p_Descripcion_evento` VARCHAR(200), IN `p_Administrador_idAdministrador` INT, IN `p_Cotizacion_No_Cotizacion` CHAR(7), IN `p_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Evento (Tipo_evento, Valor_evento, Fecha_evento, Estado_evento, Tematica_evento, Descripcion_evento, Administrador_idAdministrador, Cotizacion_No_Cotizacion, Cliente_idCliente)
    VALUES (p_Tipo_evento, p_Valor_evento, p_Fecha_evento, p_Estado_evento, p_Tematica_evento, p_Descripcion_evento, p_Administrador_idAdministrador, p_Cotizacion_No_Cotizacion, p_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PAGOS` (IN `p_No_Pagos` CHAR(5), IN `p_Nombre_Pagos` VARCHAR(45), IN `p_Apellido_Pagos` VARCHAR(45), IN `p_Dia_hora_pagos` DATETIME, IN `p_Valor_pagos` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Pagos (No_Pagos, Nombre_Pagos, Apellido_Pagos, Dia_hora_pagos, Valor_pagos, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_No_Pagos, p_Nombre_Pagos, p_Apellido_Pagos, p_Dia_hora_pagos, p_Valor_pagos, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SERVICIO` (IN `p_idServicio` CHAR(4), IN `p_Valor_servicio` INT, IN `p_Tipo_servicio` VARCHAR(45), IN `p_Descripcion_servicio` VARCHAR(200))   BEGIN
    INSERT INTO Servicio (idServicio, Valor_servicio, Tipo_servicio, Descripcion_servicio)
    VALUES (p_idServicio, p_Valor_servicio, p_Tipo_servicio, p_Descripcion_servicio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_ADMINISTRADOR` ()   BEGIN
    SELECT *
    FROM Administrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_CLIENTE` ()   BEGIN
    SELECT *
    FROM Cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COMPROBANTE` ()   BEGIN
    SELECT *
    FROM Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COTIZACION` ()   BEGIN
    SELECT *
    FROM Cotización;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COTIZANTE` ()   BEGIN
    SELECT *
    FROM Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_ENCUESTA` ()   BEGIN
    SELECT *
    FROM Encuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_EVENTO` ()   BEGIN
    SELECT *
    FROM Evento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_PAGOS` ()   BEGIN
    SELECT *
    FROM Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_SERVICIO` ()   BEGIN
    SELECT *
    FROM Servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ADMINISTRADOR` (IN `p_idAdministrador` INT)   BEGIN
    SELECT *
    FROM Administrador
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_CLIENTE` (IN `p_idCliente` CHAR(5))   BEGIN
    SELECT cl.idCliente, co.Nombre_Cotizante, co.Apellido_Cotizante, co.Telefono_Cotizante, cl.Correo_cotizante
    FROM Cliente cl
    JOIN Cotizante co ON cl.Correo_cotizante = co.Correo_Cotizante
    WHERE cl.idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5))   BEGIN
    SELECT *
    FROM Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COTIZACION` (IN `p_No_Cotizacion` CHAR(7))   BEGIN
    SELECT *
    FROM Cotización
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45))   BEGIN
    SELECT *
    FROM Cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENCUESTA` (IN `p_idEncuesta` INT)   BEGIN
    SELECT *
    FROM Encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_EVENTO` (IN `p_idEvento` INT)   BEGIN
    SELECT *
    FROM Evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_PAGOS` (IN `p_No_Pagos` CHAR(5))   BEGIN
    SELECT *
    FROM Pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SERVICIO` (IN `p_idServicio` CHAR(4))   BEGIN
    SELECT *
    FROM Servicio
    WHERE idServicio = p_idServicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ADMINISTRADOR` (IN `p_idAdministrador` INT, IN `p_Correo_Admin` VARCHAR(45), IN `p_Contraseña_admin` VARCHAR(45))   BEGIN
    UPDATE Administrador
    SET Correo_Admin = p_Correo_Admin,
        Contraseña_admin = p_Contraseña_admin
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CLIENTE` (IN `p_idCliente` CHAR(5), IN `p_Contraseña_Cliente` VARCHAR(45), IN `p_Correo_cotizante` VARCHAR(45))   BEGIN
    UPDATE Cliente
    SET Contraseña_Cliente = p_Contraseña_Cliente, Correo_cotizante = p_Correo_cotizante
    WHERE idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5), IN `p_Fecha_hora_comprobante` DATETIME, IN `p_Valor_Comprobante` INT)   BEGIN
    UPDATE Comprobante
    SET Fecha_hora_comprobante = p_Fecha_hora_comprobante,
        Valor_Comprobante = p_Valor_Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COTIZACION` (IN `p_No_Cotizacion` CHAR(7), IN `p_Ubicacion` VARCHAR(45), IN `p_Fecha_Parcial_Evento_Cotizacion` DATETIME, IN `p_Fecha_Hora_Cotizacion` DATETIME, IN `p_Valor_Cotizacion` INT, IN `p_Cantidad_Personas_Cotizacion` SMALLINT, IN `p_Cotizante_Correo` VARCHAR(45))   BEGIN
    UPDATE Cotización
    SET Ubicacion = p_Ubicacion,
        Fecha_Parcial_Evento_Cotización = p_Fecha_Parcial_Evento_Cotizacion,
        Fecha_Hora_Cotizacion = p_Fecha_Hora_Cotizacion,
        Valor_Cotización = p_Valor_Cotizacion,
        Cantidad_Personas_Cotización = p_Cantidad_Personas_Cotizacion,
        Cotizante_Correo = p_Cotizante_Correo
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45), IN `p_Nombre_Cotizante` VARCHAR(45), IN `p_Apellido_Cotizante` VARCHAR(45), IN `p_Telefono_Cotizante` VARCHAR(45))   BEGIN
    UPDATE Cotizante
    SET Correo_Cotizante = p_Correo_Cotizante,
        Nombre_Cotizante = p_Nombre_Cotizante,
        Apellido_Cotizante = p_Apellido_Cotizante,
        Telefono_Cotizante = p_Telefono_Cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ENCUESTA` (IN `p_idEncuesta` INT, IN `p_Correo_Encuesta` VARCHAR(45), IN `p_Nombre_encuesta` VARCHAR(45), IN `p_Tipo_evento_encuesta` VARCHAR(45), IN `p_Satisfaccion_encuesta` INT)   BEGIN
    UPDATE Encuesta
    SET Correo_Encuesta = p_Correo_Encuesta,
        Nombre_encuesta = p_Nombre_encuesta,
        Tipo_evento_encuesta = p_Tipo_evento_encuesta,
        Satisfaccion_encuesta = p_Satisfaccion_encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_EVENTO` (IN `p_idEvento` INT, IN `p_Tipo_evento` VARCHAR(45), IN `p_Valor_evento` INT, IN `p_Fecha_evento` DATETIME, IN `p_Estado_evento` VARCHAR(45), IN `p_Tematica_evento` VARCHAR(45), IN `p_Descripcion_evento` VARCHAR(200))   BEGIN
    UPDATE Evento
    SET Tipo_evento = p_Tipo_evento,
        Valor_evento = p_Valor_evento,
        Fecha_evento = p_Fecha_evento,
        Estado_evento = p_Estado_evento,
        Tematica_evento = p_Tematica_evento,
        Descripcion_evento = p_Descripcion_evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PAGOS` (IN `p_No_Pagos` CHAR(5), IN `p_Nombre_Pagos` VARCHAR(45), IN `p_Apellido_Pagos` VARCHAR(45), IN `p_Dia_hora_pagos` DATETIME, IN `p_Valor_pagos` INT)   BEGIN
    UPDATE Pagos
    SET Nombre_Pagos = p_Nombre_Pagos,
        Apellido_Pagos = p_Apellido_Pagos,
        Dia_hora_pagos = p_Dia_hora_pagos,
        Valor_pagos = p_Valor_pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SERVICIO` (IN `p_idServicio` CHAR(4), IN `p_Valor_servicio` INT, IN `p_Tipo_servicio` VARCHAR(45), IN `p_Descripcion_servicio` VARCHAR(200))   BEGIN
    UPDATE Servicio
    SET Valor_servicio = p_Valor_servicio,
        Tipo_servicio = p_Tipo_servicio,
        Descripcion_servicio = p_Descripcion_servicio
    WHERE idServicio = p_idServicio;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `Correo_Admin` varchar(45) NOT NULL,
  `Contraseña_admin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `Correo_Admin`, `Contraseña_admin`) VALUES
(1, 'juliansanabria@gmail.com', 'newdreams001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` char(5) NOT NULL,
  `Contraseña_Cliente` varchar(45) NOT NULL,
  `Correo_cotizante` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Contraseña_Cliente`, `Correo_cotizante`) VALUES
('CL001', 'abc123', 'pepitoperez@gmail.com'),
('CL002', 'añlm5nv4o5cd', 'mariamartinez@gmail.com'),
('CL003', 'd28v5f4f', 'mauriciotorres@gmail.com'),
('CL004', 'd2fg6f9d8Ee', 'valentinapaez@gmail.com'),
('CL005', 'EFrfg3548eD54', 'santiagocastellanos@gmail.com'),
('CL006', '123a', 'mariamartinez2@gmail.com');

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `generar_idCliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    DECLARE nuevo_idCliente CHAR(5);
    DECLARE nuevo_contador INT;

    -- Obtener el nuevo valor del contador y actualizarlo
    SELECT contador + 1 INTO nuevo_contador FROM Contador_Cliente;
    UPDATE Contador_Cliente SET contador = nuevo_contador;

    -- Generar el nuevo idCliente
    SET nuevo_idCliente = CONCAT('CL', LPAD(nuevo_contador, 3, '0'));

    -- Asignar el nuevo idCliente al registro que se está insertando
    SET NEW.idCliente = nuevo_idCliente;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `No_Comprobante` char(5) NOT NULL,
  `Fecha_hora_comprobante` datetime NOT NULL,
  `Valor_Comprobante` int(11) NOT NULL,
  `Pagos_No_Pagos` char(5) NOT NULL,
  `Pagos_Evento_idEvento` int(11) NOT NULL,
  `Pagos_Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`No_Comprobante`, `Fecha_hora_comprobante`, `Valor_Comprobante`, `Pagos_No_Pagos`, `Pagos_Evento_idEvento`, `Pagos_Evento_Cliente_idCliente`) VALUES
('C01', '2023-10-25 10:30:00', 5500000, 'P0001', 1, 'CL001'),
('C02', '2024-06-23 06:00:00', 7000000, 'P0002', 2, 'CL002'),
('C03', '2024-02-03 02:00:00', 3000000, 'P0003', 3, 'CL003'),
('C04', '2023-07-28 10:15:00', 2500000, 'P0004', 4, 'CL004'),
('C05', '2023-08-02 02:30:00', 4500000, 'P0005', 5, 'CL005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contador_cliente`
--

CREATE TABLE `contador_cliente` (
  `contador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contador_cliente`
--

INSERT INTO `contador_cliente` (`contador`) VALUES
(7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_servicio`
--

CREATE TABLE `cotizacion_servicio` (
  `Cotizacion_No_Cotizacion` char(7) NOT NULL,
  `Servicio_idServicio` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion_servicio`
--

INSERT INTO `cotizacion_servicio` (`Cotizacion_No_Cotizacion`, `Servicio_idServicio`) VALUES
('COT1001', 'S01'),
('COT1001', 'S02'),
('COT1001', 'S03'),
('COT1001', 'S04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotización`
--

CREATE TABLE `cotización` (
  `No_Cotizacion` char(7) NOT NULL,
  `Ubicacion` varchar(45) NOT NULL,
  `Fecha_Parcial_Evento_Cotización` datetime NOT NULL,
  `Fecha_Hora_Cotizacion` datetime NOT NULL,
  `Valor_Cotización` int(11) NOT NULL,
  `Cantidad_Personas_Cotización` smallint(6) NOT NULL,
  `Cotizante_Correo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotización`
--

INSERT INTO `cotización` (`No_Cotizacion`, `Ubicacion`, `Fecha_Parcial_Evento_Cotización`, `Fecha_Hora_Cotizacion`, `Valor_Cotización`, `Cantidad_Personas_Cotización`, `Cotizante_Correo`) VALUES
('COT1001', 'Salon comunal kennedy', '2023-10-20 08:00:00', '2023-06-15 02:54:00', 5000000, 100, 'mauriciotorres@gmail.com'),
('COT1002', 'Salon comunal bella vista', '2024-06-23 06:00:00', '2023-04-18 03:35:00', 7000000, 150, 'pepitoperez@gmail.com'),
('COT1003', 'Salon comunal perseverancia', '2024-02-03 02:00:00', '2023-05-01 08:00:00', 3500000, 80, 'valentinapaez@gmail.com'),
('COT1004', 'Salon comunal puente aranda', '2023-07-15 07:30:00', '2023-07-28 10:15:00', 2500000, 70, 'santiagocastellanos@gmail.com'),
('COT1005', 'Salon comunal bosa', '2023-12-30 12:45:00', '2023-08-02 02:30:00', 4500000, 80, 'mauriciotorres@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizante`
--

CREATE TABLE `cotizante` (
  `Correo_Cotizante` varchar(45) NOT NULL,
  `Nombre_Cotizante` varchar(45) NOT NULL,
  `Apellido_Cotizante` varchar(45) NOT NULL,
  `Telefono_Cotizante` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizante`
--

INSERT INTO `cotizante` (`Correo_Cotizante`, `Nombre_Cotizante`, `Apellido_Cotizante`, `Telefono_Cotizante`) VALUES
('mariamartinez2@gmail.com', 'maria', 'martinez', '12345'),
('mariamartinez@gmail.com', 'Maria', 'Martinez', '3224532545'),
('mauriciotorres@gmail.com', 'Mauricio', 'Torres', '3229851236'),
('pepitoperez@gmail.com', 'Pepito', 'Perez', '3224569875'),
('santiagocastellanos@gmail.com', 'Santiago', 'Castellanos', '3112365478'),
('valentinapaez@gmail.com', 'Valentina', 'Paez', '3102548965');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `Correo_Encuesta` varchar(45) NOT NULL,
  `Nombre_encuesta` varchar(45) NOT NULL,
  `Tipo_evento_encuesta` varchar(45) NOT NULL,
  `Satisfaccion_encuesta` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`idEncuesta`, `Correo_Encuesta`, `Nombre_encuesta`, `Tipo_evento_encuesta`, `Satisfaccion_encuesta`, `Evento_idEvento`, `Evento_Cliente_idCliente`) VALUES
(1, 'mauriciotorres@gmail.com', 'Mauricio', 'Xv años', 10, 1, 'CL001'),
(2, 'pepitoperez@gmail.com', 'Pepito', 'Grado', 10, 2, 'CL002'),
(3, 'valentinapaez@gmail.com', 'Valentina', 'Boda', 10, 3, 'CL003'),
(4, 'santiagocastellanos@gmail.com', 'Santiago', 'Bautizo', 10, 4, 'CL004'),
(5, 'mauriciotorres@gmail.com', 'Mauricio', 'Xv años', 10, 5, 'CL005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `Tipo_evento` varchar(45) NOT NULL,
  `Valor_evento` int(11) NOT NULL,
  `Fecha_evento` datetime NOT NULL,
  `Estado_evento` varchar(45) NOT NULL,
  `Tematica_evento` varchar(45) NOT NULL,
  `Descripcion_evento` varchar(200) NOT NULL,
  `Administrador_idAdministrador` int(11) NOT NULL,
  `Cotizacion_No_Cotizacion` char(7) NOT NULL,
  `Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `Tipo_evento`, `Valor_evento`, `Fecha_evento`, `Estado_evento`, `Tematica_evento`, `Descripcion_evento`, `Administrador_idAdministrador`, `Cotizacion_No_Cotizacion`, `Cliente_idCliente`) VALUES
(1, 'Xv años', 5500000, '2023-10-25 10:30:00', 'Activo', 'Neon', 'Decoración totalmente neón, centros de mesa con ramosde flores fluorecentes, protocolo clasico, mariachis sorpresa\r\n  intervencion del padre, regalo de la madre, comida, hora loca, bebidas, fin', 1, 'COT1001', 'CL001'),
(2, 'Grado', 8000000, '2024-06-23 06:00:00', 'Activo', 'Clasico', 'Graduacion ingeniero aeronautico, ubicado en un avion dentro del hangar del aeropuerto, decoracion clasica, comida basica', 1, 'COT1002', 'CL002'),
(3, 'Boda', 3000000, '2024-02-03 02:00:00', 'Activo', 'Color negro', 'Decoracion a blanco y negro, protocolo clasico, regal sorpresa de la familiade la novia', 1, 'COT1003', 'CL003'),
(4, 'Bautizo', 2500000, '2023-07-15 07:30:00', 'Activo', 'Clasico', 'Bautizo clasico, comida con 3 carnes y 2 bebidas', 1, 'COT1004', 'CL004'),
(5, 'Xv años', 5000000, '2023-12-30 12:45:00', 'Activo', 'Francia', 'Ratatouille con vino añejo', 1, 'COT1005', 'CL005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento_servicio`
--

CREATE TABLE `evento_servicio` (
  `Evento_idEvento` int(11) NOT NULL,
  `Servicio_idServicio` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento_servicio`
--

INSERT INTO `evento_servicio` (`Evento_idEvento`, `Servicio_idServicio`) VALUES
(1, 'S01'),
(1, 'S02'),
(1, 'S03'),
(1, 'S04'),
(1, 'S05'),
(2, 'S01'),
(2, 'S02'),
(2, 'S03'),
(2, 'S04'),
(3, 'S01'),
(3, 'S02'),
(3, 'S03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `No_Pagos` char(5) NOT NULL,
  `Nombre_Pagos` varchar(45) NOT NULL,
  `Apellido_Pagos` varchar(45) NOT NULL,
  `Dia_hora_pagos` datetime NOT NULL,
  `Valor_pagos` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`No_Pagos`, `Nombre_Pagos`, `Apellido_Pagos`, `Dia_hora_pagos`, `Valor_pagos`, `Evento_idEvento`, `Evento_Cliente_idCliente`) VALUES
('P0001', 'Mauricio', 'Torres', '2023-10-25 10:30:00', 50000, 1, 'CL001'),
('P0002', 'Pepito', 'Perez', '2024-06-23 06:00:00', 70000, 2, 'CL002'),
('P0003', 'Valentina', 'Paez', '2024-02-03 02:00:00', 30000, 3, 'CL003'),
('P0004', 'Santiago', 'Castellanos', '2023-07-28 10:15:00', 250000, 4, 'CL004'),
('P0005', 'Mauricio', 'Torres', '2023-08-02 02:30:00', 450000, 5, 'CL005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` char(4) NOT NULL,
  `Valor_Servicio` int(11) NOT NULL,
  `Tipo_Servicio` varchar(45) NOT NULL,
  `Descripcion_servicio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `Valor_Servicio`, `Tipo_Servicio`, `Descripcion_servicio`) VALUES
('S01', 500, 'Silla Blanca', 'Silla blanca, marca rimax, con espaldar y reposabrazos'),
('S02', 2000, 'Mesa 8 puestos', 'Mesa larga 8 puestos marca rimax'),
('S03', 1000, 'Mantel cuadrado', 'Mantel cuadrado en tela de seda'),
('S04', 800, 'Centro de mesa de vidrio', 'Centro de mesa de vidrio cilindricio'),
('S05', 700, 'Tapas mesa', 'Tapas de mesa en tela seda');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `Correo_cotizante` (`Correo_cotizante`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD KEY `Pagos_No_Pagos` (`Pagos_No_Pagos`),
  ADD KEY `Pagos_Evento_idEvento` (`Pagos_Evento_idEvento`),
  ADD KEY `Pagos_Evento_Cliente_idCliente` (`Pagos_Evento_Cliente_idCliente`);

--
-- Indices de la tabla `cotizacion_servicio`
--
ALTER TABLE `cotizacion_servicio`
  ADD KEY `Cotizacion_No_Cotizacion` (`Cotizacion_No_Cotizacion`),
  ADD KEY `Servicio_idServicio` (`Servicio_idServicio`);

--
-- Indices de la tabla `cotización`
--
ALTER TABLE `cotización`
  ADD PRIMARY KEY (`No_Cotizacion`),
  ADD KEY `Cotizante_Correo` (`Cotizante_Correo`);

--
-- Indices de la tabla `cotizante`
--
ALTER TABLE `cotizante`
  ADD PRIMARY KEY (`Correo_Cotizante`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Evento_Cliente_idCliente` (`Evento_Cliente_idCliente`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `Administrador_idAdministrador` (`Administrador_idAdministrador`),
  ADD KEY `Cotizacion_No_Cotizacion` (`Cotizacion_No_Cotizacion`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Indices de la tabla `evento_servicio`
--
ALTER TABLE `evento_servicio`
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Servicio_idServicio` (`Servicio_idServicio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`No_Pagos`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Evento_Cliente_idCliente` (`Evento_Cliente_idCliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Correo_cotizante`) REFERENCES `cotizante` (`Correo_Cotizante`);

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`Pagos_No_Pagos`) REFERENCES `pagos` (`No_Pagos`),
  ADD CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`Pagos_Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `comprobante_ibfk_3` FOREIGN KEY (`Pagos_Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `cotizacion_servicio`
--
ALTER TABLE `cotizacion_servicio`
  ADD CONSTRAINT `cotizacion_servicio_ibfk_1` FOREIGN KEY (`Cotizacion_No_Cotizacion`) REFERENCES `cotización` (`No_Cotizacion`),
  ADD CONSTRAINT `cotizacion_servicio_ibfk_2` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `cotización`
--
ALTER TABLE `cotización`
  ADD CONSTRAINT `cotización_ibfk_1` FOREIGN KEY (`Cotizante_Correo`) REFERENCES `cotizante` (`Correo_Cotizante`);

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `encuesta_ibfk_2` FOREIGN KEY (`Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`Cotizacion_No_Cotizacion`) REFERENCES `cotización` (`No_Cotizacion`),
  ADD CONSTRAINT `evento_ibfk_3` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `evento_servicio`
--
ALTER TABLE `evento_servicio`
  ADD CONSTRAINT `evento_servicio_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `evento_servicio_ibfk_2` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
