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


public class CacheTableGroupToCityObject extends CacheTableModel {
	public static CacheTableGroupToCityObject instance = null;
	
	private CacheTableGroupToCityObject() {		
	}
	
	public synchronized static CacheTableGroupToCityObject getInstance() {
		if (instance == null)
			instance = new CacheTableGroupToCityObject();
		
		return instance;
	}

	@Override
	public void createIndexes(Connection conn, String tableName, String properties) throws SQLException {
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();	
			stmt.executeUpdate("create index idx_" + tableName + " on " + tableName + " (GROUP_ID) " + properties);
			stmt.executeUpdate("create index idx1_" + tableName + " on " + tableName + " (IS_PARENT) " + properties);
		} finally {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		}
	}

	@Override
	public CacheTableModelEnum getType() {
		return CacheTableModelEnum.GROUP_TO_CITYOBJECT;
	}
	
	@Override
	protected String getColumns() {
		return "(GROUP_ID INTEGER," +
		"GMLID VARCHAR(256), " +
		"IS_PARENT NUMERIC(1,0), " +
		"ROLE VARCHAR(256))";
	}
}
