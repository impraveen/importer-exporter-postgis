/*
 * This file is part of the 3D City Database Importer/Exporter.
 * Copyright (c) 2007 - 2013
 * Institute for Geodesy and Geoinformation Science
 * Technische Universitaet Berlin, Germany
 * http://www.gis.tu-berlin.de/
 * 
 * The 3D City Database Importer/Exporter program is free software:
 * you can redistribute it and/or modify it under the terms of the
 * GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program. If not, see 
 * <http://www.gnu.org/licenses/>.
 * 
 * The development of the 3D City Database Importer/Exporter has 
 * been financially supported by the following cooperation partners:
 * 
 * Business Location Center, Berlin <http://www.businesslocationcenter.de/>
 * virtualcitySYSTEMS GmbH, Berlin <http://www.virtualcitysystems.de/>
 * Berlin Senate of Business, Technology and Women <http://www.berlin.de/sen/wtf/>
 */
package de.tub.citydb.modules.citygml.common.database.cache.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


public class CacheTableTextureAssociation extends CacheTableModel {
	public static CacheTableTextureAssociation instance = null;
	
	private CacheTableTextureAssociation() {		
	}
	
	public synchronized static CacheTableTextureAssociation getInstance() {
		if (instance == null)
			instance = new CacheTableTextureAssociation();
		
		return instance;
	}

	@Override
	public void createIndexes(Connection conn, String tableName, String properties) throws SQLException {
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			
			stmt.executeUpdate("create index idx_" + tableName + " on " + tableName + " (GMLID) " + properties);
		} finally {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		}
	}

	@Override
	public CacheTableModelEnum getType() {
		return CacheTableModelEnum.TEXTUREASSOCIATION;
	}
	
	@Override
	protected String getColumns() {
		return "(SURFACE_DATA_ID INTEGER, " +
		"SURFACE_GEOMETRY_ID INTEGER, " +
		"GMLID VARCHAR(256))";
	}

}
