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
package de.tub.citydb.modules.citygml.importer.database.content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import de.tub.citydb.config.internal.Internal;

public class DBAppearToSurfaceData implements DBImporter {
	private final Connection batchConn;
	private final DBImporterManager dbImporterManager;

	private PreparedStatement psAppearToSurfaceData;
	private int batchCounter;

	public DBAppearToSurfaceData(Connection batchConn, DBImporterManager dbImporterManager) throws SQLException {
		this.batchConn = batchConn;
		this.dbImporterManager = dbImporterManager;

		init();
	}

	private void init() throws SQLException {
		psAppearToSurfaceData = batchConn.prepareStatement("insert into APPEAR_TO_SURFACE_DATA (SURFACE_DATA_ID, APPEARANCE_ID) values " +
			"(?, ?)");
	}

	public void insert(long surfaceDataId, long appearanceId) throws SQLException {
		psAppearToSurfaceData.setLong(1, surfaceDataId);
		psAppearToSurfaceData.setLong(2, appearanceId);

		psAppearToSurfaceData.addBatch();
		if (++batchCounter == Internal.POSTGRESQL_MAX_BATCH_SIZE)
			dbImporterManager.executeBatch(DBImporterEnum.APPEAR_TO_SURFACE_DATA);
	}

	@Override
	public void executeBatch() throws SQLException {
		psAppearToSurfaceData.executeBatch();
		batchCounter = 0;
	}

	@Override
	public void close() throws SQLException {
		psAppearToSurfaceData.close();
	}

	@Override
	public DBImporterEnum getDBImporterType() {
		return DBImporterEnum.APPEAR_TO_SURFACE_DATA;
	}

}
