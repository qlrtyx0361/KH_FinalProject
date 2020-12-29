package com.kh.spring.common.typeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 * TypeHandler 클래스는 3개의 getter 메소드와 1개의 setter 메소드로<br>
 * 이루어져 있다. 
 * 
 * <h3>setter</h3>
 * <p> String[] ==> String </p>
 * 
 * <h3>getter</h3>
 * <p>1. ResultSet에서 컬럼이름을 가져오는 getter</p>
 * <p>2. ResultSet에서 컬럼의 순번을 가져오는 getter</p>
 * <p>3. PL/SQL(프로시져)를 위한 CallableStatement 전용 getter</p>
 * 
 * @author daniel
 *
 */
public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if( parameter != null ) {
			ps.setString(i, String.join(",", parameter));
		} else {
			ps.setString(i, "");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rset, String columnName) throws SQLException {
		String value = rset.getString(columnName);
		String[] result = value.split(",");
		
		return result;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		
		String value = rs.getString(columnIndex);
		String[] result = value.split(",");
		return result;
		
		// return rs.getString(columnIndex).split(",");
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String value = cs.getString(columnIndex);
		String[] result = value.split(",");
		return result;
	}

}
