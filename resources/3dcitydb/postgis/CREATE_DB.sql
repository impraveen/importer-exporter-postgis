-- CREATE_DB.sql
--
-- Authors:     Prof. Dr. Thomas H. Kolbe <kolbe@igg.tu-berlin.de>
--              Gerhard König <gerhard.koenig@tu-berlin.de>
--              Claus Nagel <nagel@igg.tu-berlin.de>
--              Alexandra Stadler <stroh@igg.tu-berlin.de>
--
-- Conversion:	Felix Kunde <felix-kunde@gmx.de>
--
-- Copyright:   (c) 2007-2012, Institute for Geodesy and Geoinformation Science,
--                             Technische Universität Berlin, Germany
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
-- Version | Date       | Description                               | Author | Conversion
-- 2.0.1     2008-06-28   versioning is enabled depending on var      TKol	   
-- 2.0.0     2011-12-11   PostGIS version                             TKol	   FKun
--                                                                    GKoe
--                                                                    CNag
--                                                                    ASta
--

-- This script is called from CREATE_DB.bat

\i SCHEMA/TABLES/METADATA/DATABASE_SRS.sql
INSERT INTO DATABASE_SRS(SRID,GML_SRS_NAME) VALUES (3068,'urn:ogc:def:crs,crs:EPSG:6.12:3068,crs:EPSG:6.12:5783');

--// create tables
\i SCHEMA/TABLES/METADATA/OBJECTCLASS.sql
\i SCHEMA/TABLES/CORE/CITYMODEL.sql
\i SCHEMA/TABLES/CORE/CITYOBJECT.sql
\i SCHEMA/TABLES/CORE/CITYOBJECT_MEMBER.sql
\i SCHEMA/TABLES/CORE/EXTERNAL_REFERENCE.sql
\i SCHEMA/TABLES/CORE/GENERALIZATION.sql
\i SCHEMA/TABLES/CORE/IMPLICIT_GEOMETRY.sql
\i SCHEMA/TABLES/GEOMETRY/SURFACE_GEOMETRY.sql
\i SCHEMA/TABLES/CITYFURNITURE/CITY_FURNITURE.sql
\i SCHEMA/TABLES/GENERICS/CITYOBJECT_GENERICATTRIB.sql
\i SCHEMA/TABLES/GENERICS/GENERIC_CITYOBJECT.sql
\i SCHEMA/TABLES/CITYOBJECTGROUP/CITYOBJECTGROUP.sql
\i SCHEMA/TABLES/CITYOBJECTGROUP/GROUP_TO_CITYOBJECT.sql
\i SCHEMA/TABLES/BUILDING/ADDRESS.sql
\i SCHEMA/TABLES/BUILDING/ADDRESS_TO_BUILDING.sql
\i SCHEMA/TABLES/BUILDING/BUILDING.sql
\i SCHEMA/TABLES/BUILDING/BUILDING_FURNITURE.sql
\i SCHEMA/TABLES/BUILDING/BUILDING_INSTALLATION.sql
\i SCHEMA/TABLES/BUILDING/OPENING.sql
\i SCHEMA/TABLES/BUILDING/OPENING_TO_THEM_SURFACE.sql
\i SCHEMA/TABLES/BUILDING/ROOM.sql
\i SCHEMA/TABLES/BUILDING/THEMATIC_SURFACE.sql
\i SCHEMA/TABLES/APPEARANCE/APPEARANCE.sql
\i SCHEMA/TABLES/APPEARANCE/SURFACE_DATA.sql
\i SCHEMA/TABLES/APPEARANCE/TEXTUREPARAM.sql
\i SCHEMA/TABLES/APPEARANCE/APPEAR_TO_SURFACE_DATA.sql
\i SCHEMA/TABLES/RELIEF/BREAKLINE_RELIEF.sql
\i SCHEMA/TABLES/RELIEF/MASSPOINT_RELIEF.sql
\i SCHEMA/TABLES/RELIEF/RASTER_RELIEF.sql
\i SCHEMA/TABLES/RELIEF/RASTER_RELIEF_IMP.sql
\i SCHEMA/TABLES/RELIEF/RELIEF.sql
\i SCHEMA/TABLES/RELIEF/RELIEF_COMPONENT.sql
\i SCHEMA/TABLES/RELIEF/RELIEF_FEAT_TO_REL_COMP.sql
\i SCHEMA/TABLES/RELIEF/RELIEF_FEATURE.sql
\i SCHEMA/TABLES/RELIEF/TIN_RELIEF.sql
\i SCHEMA/TABLES/ORTHOPHOTO/ORTHOPHOTO.sql;
\i SCHEMA/TABLES/ORTHOPHOTO/ORTHOPHOTO_IMP.sql;
\i SCHEMA/TABLES/TRANSPORTATION/TRANSPORTATION_COMPLEX.sql
\i SCHEMA/TABLES/TRANSPORTATION/TRAFFIC_AREA.sql
\i SCHEMA/TABLES/LANDUSE/LAND_USE.sql
\i SCHEMA/TABLES/VEGETATION/PLANT_COVER.sql
\i SCHEMA/TABLES/VEGETATION/SOLITARY_VEGETAT_OBJECT.sql
\i SCHEMA/TABLES/WATERBODY/WATERBODY.sql
\i SCHEMA/TABLES/WATERBODY/WATERBOD_TO_WATERBND_SRF.sql
\i SCHEMA/TABLES/WATERBODY/WATERBOUNDARY_SURFACE.sql

--// activate constraints
\i SCHEMA/CONSTRAINTS/CONSTRAINTS.sql

--// BUILD INDEXES
\i SCHEMA/INDEXES/SIMPLE_INDEX.sql
\i SCHEMA/INDEXES/SPATIAL_INDEX.sql

\i UTIL/CREATE_DB/OBJECTCLASS_INSTANCES.sql
\i UTIL/CREATE_DB/IMPORT_PROCEDURES.sql
\i UTIL/CREATE_DB/DUMMY_IMPORT.sql

--// create GEODB_PKG schema
CREATE SCHEMA geodb_pkg;

CREATE PROCEDURAL LANGUAGE plpgsql;
ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;
SET search_path = public, pg_catalog;

\i PL_SQL/GEODB_PKG/UTIL/UTIL.sql;
\i PL_SQL/GEODB_PKG/INDEX/IDX.sql;
\i PL_SQL/GEODB_PKG/STATISTICS/STAT.sql;
\i PL_SQL/GEODB_PKG/DELETE/DELETE.sql;
\i PL_SQL/GEODB_PKG/DELETE/DELETE_BY_LINEAGE.sql;

/*--// (possibly) activate versioning
BEGIN
  :VERSIONBATCHFILE := 'UTIL/CREATE_DB/DO_NOTHING.sql';
END;
/
BEGIN
  IF ('&VERSIONING'='yes' OR '&VERSIONING'='YES' OR '&VERSIONING'='y' OR '&VERSIONING'='Y') THEN
    :VERSIONBATCHFILE := 'ENABLE_VERSIONING.sql';
  END IF;
END;
/
-- Transfer the value from the bind variable to the substitution variable
column mc2 new_value VERSIONBATCHFILE2 print
select :VERSIONBATCHFILE mc2 from dual;
\i &VERSIONBATCHFILE2
*/
--// CREATE TABLES & PROCEDURES OF THE PLANNINGMANAGER
--\i PL_SQL/MOSAIC/MOSAIC.sql;
--\i CREATE_PLANNING_MANAGER.sql
