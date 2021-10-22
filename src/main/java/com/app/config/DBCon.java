package com.app.config;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.mysql.cj.jdbc.MysqlDataSource;

public class DBCon {
	
	private DBCon() {}

	private static final Logger log = Logger.getLogger(DBCon.class);
	
	public static Connection connection() throws SQLException {
		return dataSourse().getConnection();
	}

	private static DataSource dataSourse() {
		log.info("Configuring datasource");
		MysqlDataSource ds = new MysqlDataSource();
		ds.setUrl("jdbc:mysql://localhost:3306/student2");
		ds.setUser("root");
		ds.setPassword("Shubham@958");
		return ds;
	}
}
