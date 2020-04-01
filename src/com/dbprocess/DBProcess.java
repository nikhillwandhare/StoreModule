package com.dbprocess;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class DBProcess {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public HashMap executeProcedure(String packageName, String procedureName, Map parameters) {
		Map map = null;
		try {
			SimpleJdbcCall dbcall = new SimpleJdbcCall(jdbcTemplate);
			dbcall.withCatalogName(packageName);
			dbcall.withProcedureName(procedureName);
			SqlParameterSource parameter = new MapSqlParameterSource(parameters);
			map = dbcall.execute(parameter);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcTemplate.getDataSource().getConnection().close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return (HashMap) map;
	}
}
