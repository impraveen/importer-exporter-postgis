-- BUILDING_INSTALLATION.sql
--
-- Authors:     Prof. Dr. Thomas H. Kolbe <kolbe@igg.tu-berlin.de>
--              Gerhard K�nig <gerhard.koenig@tu-berlin.de>
--              Claus Nagel <nagel@igg.tu-berlin.de>
--              Alexandra Stadler <stadler@igg.tu-berlin.de>
--
-- Conversion:  Laure Fraysse <Laure.fraysse@etumel.univmed.fr>
--				Felix Kunde <felix-kunde@gmx.de>
--
-- Copyright:   (c) 2007-2011  Institute for Geodesy and Geoinformation Science,
--                             Technische Universit�t Berlin, Germany
--                             http://www.igg.tu-berlin.de
--
--              This skript is free software under the LGPL Version 2.1.
--              See the GNU Lesser General Public License at
--              http://www.gnu.org/copyleft/lgpl.html
--              for more details.
-------------------------------------------------------------------------------
-- About:
--
--
-------------------------------------------------------------------------------
--
-- ChangeLog:
--
-- Version | Date       | Description     | Author | Conversion
-- 2.0.0     2011-12-09   PostGIS version    TKol	  LFra	
--                                           GKoe     FKun
--                                           CNag
--                                           ASta
--
CREATE TABLE BUILDING_INSTALLATION (
	ID 									SERIAL NOT NULL,
	IS_EXTERNAL 						NUMERIC(1, 0),
	NAME 								VARCHAR(1000),
	NAME_CODESPACE 						VARCHAR(4000),
	DESCRIPTION 						VARCHAR(4000),
	CLASS 								VARCHAR(256),
	FUNCTION 							VARCHAR(1000),
	USAGE 								VARCHAR(1000),
	BUILDING_ID 						INTEGER,
	ROOM_ID 							INTEGER,
	LOD2_GEOMETRY_ID 					INTEGER,
	LOD3_GEOMETRY_ID 					INTEGER,
	LOD4_GEOMETRY_ID 					INTEGER
)
;

ALTER TABLE BUILDING_INSTALLATION
ADD CONSTRAINT BUILDING_INSTALLATION_PK PRIMARY KEY
(
ID
)
;