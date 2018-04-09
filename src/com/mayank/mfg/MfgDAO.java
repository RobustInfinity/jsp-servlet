package com.mayank.mfg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class MfgDAO {

	private Connection getConnection() throws ClassNotFoundException, SQLException {
		ResourceBundle rb = ResourceBundle.getBundle("dbconfig");
		Class.forName(rb.getString("driverName"));
		Connection connection = DriverManager.getConnection(rb.getString("dburl"), rb.getString("userid"), rb.getString("password"));
		return connection;
	}
	
	public boolean add(MfgDTO mfgDTO) throws SQLException {
		Connection connection = null;
		PreparedStatement pstmt = null;
		Integer rowCount;
		String sql = "insert into manufacturer_table (company_name, supervisor, contact_no, address, gstin_no,flag) values(?,?,?,?,?,?)";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, mfgDTO.getCompanyName());
			pstmt.setString(2, mfgDTO.getSupervisor());
			pstmt.setString(3, mfgDTO.getContactNo());
			pstmt.setString(4, mfgDTO.getAddress());
			pstmt.setString(5, mfgDTO.getGstinNo());
			pstmt.setString(6, "Y");
			rowCount = pstmt.executeUpdate();
			while(rowCount!=0) {
				return true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(connection!=null) {
				connection.close();
			}
		}
		return false;
	}
	
	public ArrayList<MfgDTO> update(Integer companyNo) throws ClassNotFoundException, SQLException {
		String flag="Y";
		if(MfgOperations.getInstance().isFlag(companyNo)) {
			flag="N";
//			System.out.println(ItemOperations.getInstance().getItemList().get(4).getStatus());
		}
	Connection connection =null;
	PreparedStatement pstmt =null;
	Integer rowCount;
	String sql = "update manufacturer_table set flag=(?) where company_no=(?)";
	
	try {
		connection = getConnection();
		pstmt=connection.prepareStatement(sql);
		pstmt.setString(1, flag);
		pstmt.setInt(2, companyNo);
		rowCount = pstmt.executeUpdate();
		if(rowCount != 0) {
			return MfgOperations.getInstance().getManufacturerList();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		if(pstmt!=null) {
			pstmt.close();
		}
		if(connection!=null) {
			connection.close();
		}
	}
	return null;
		
	}
	public ArrayList<MfgDTO> view() throws ClassNotFoundException, SQLException {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MfgDTO> mfgList = new ArrayList<>();
		String sql = "select company_no, company_name, supervisor, contact_no, address, gstin_no,flag from manufacturer_table";
		try {
		connection =getConnection();
		pstmt = connection.prepareStatement(sql);
		rs =pstmt.executeQuery();
		while(rs.next()) {
			MfgDTO mfgDTO = new MfgDTO();
			mfgDTO.setCompanyNo(rs.getInt("company_no"));
			mfgDTO.setCompanyName(rs.getString("company_name"));
			mfgDTO.setSupervisor(rs.getString("supervisor"));
			mfgDTO.setContactNo(rs.getString("contact_no"));
			mfgDTO.setAddress(rs.getString("address"));
			mfgDTO.setGstinNo(rs.getString("gstin_no"));
			mfgDTO.setStatus(rs.getString("flag"));
			mfgList.add(mfgDTO);
		}
		}
		
		finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(connection!=null) {
				connection.close();
			}
		}
		return mfgList;
	}
	
}
