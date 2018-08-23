package com.mrporter.pomangam.common.login.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.login.vo.UserBean;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.common.security.password.PasswordEncoding;
import com.mrporter.pomangam.common.security.password.SHAPasswordEncoder;
import com.mrporter.pomangam.common.sql.Config;

/**
 * UserCrudDAO
 * 
 * @version 1.0 [2018. 8. 10.]
 * @author Choi
 */
public class UserCrudDAO extends Crud<UserBean> {
	private static final String TABLENAME = "member"; 
	
	/**
	 * @param tableName
	 */
	public UserCrudDAO() {
		super(TABLENAME);
	}
	
	public UserBean getMember(String username) {
		Connection conn = Config.getInstance().sqlLogin();
		UserBean result = null;
		List<Map<String, Object>> listOfMaps = null;
		try {
			QueryRunner queryRunner = new QueryRunner();
			listOfMaps = queryRunner.query(conn, "SELECT * FROM " + TABLENAME + " WHERE username = ?;", 
						new MapListHandler(), username);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		
		if(!listOfMaps.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(listOfMaps.get(0)), 
					new TypeToken<UserBean>() {}.getType());
		}
		return result;
	}
	
	@Override
	public Integer insert(UserBean bean) throws Exception {
		bean.setPassword(getBcryptCipher(bean.getPassword()));
		return super.insert(bean);
	}
	
	@Override
	public void update(UserBean bean) throws Exception {
		Connection conn = Config.getInstance().sqlLogin();
		try {
			QueryRunner queryRunner = new QueryRunner();
			
			queryRunner.update(conn, "UPDATE " + TABLENAME + " SET nickname=?, targetidx=?, subscribeidx=?, regdate=?, moddate=?  WHERE username = ?;", 
					bean.getNickname(),
					bean.getTargetidx(),
					bean.getSubscribeidx(),
					bean.getRegdate(),
					bean.getModdate(),
					bean.getUsername()); 
			
			if(bean.getPassword() != null) {
				bean.setPassword(getBcryptCipher(bean.getPassword()));
				queryRunner.update(conn, "UPDATE " + TABLENAME + " SET password=?  WHERE username = ?;", 
						bean.getPassword(),
						bean.getUsername()); 
			}
			
		} finally {
			DbUtils.closeQuietly(conn);
		}
	}
	
	public void setTarget(String username, Integer idx_target) throws Exception {
		sqlUpdate("UPDATE member SET idx_target = ? WHERE username = ?", idx_target, username);
	}
	
	private String getBcryptCipher(String plaintext) {
		SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
		shaPasswordEncoder.setEncodeHashAsBase64(true);
		PasswordEncoding pwEncoder = new PasswordEncoding(shaPasswordEncoder);
		PasswordEncoding bCryptEncoder = new PasswordEncoding(new BCryptPasswordEncoder());
		
		return bCryptEncoder.encode(pwEncoder.encode(plaintext));
	}
}
