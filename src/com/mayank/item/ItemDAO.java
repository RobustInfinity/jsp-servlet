package com.mayank.item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class ItemDAO {

	private Connection getConnection() throws ClassNotFoundException, SQLException {
		ResourceBundle rb = ResourceBundle.getBundle("dbconfig");
		Class.forName(rb.getString("driverName"));
		Connection connection = DriverManager.getConnection(rb.getString("dburl"), rb.getString("userid"), rb.getString("password"));
		return connection;
	}
	
	public boolean add(ItemDTO itemDTO) throws SQLException {
		Connection connection = null;
		PreparedStatement pstmt = null;
		Integer rowCount;
		String sql = "insert into item_table (item_name, item_price, cgst, sgst, manufacturer, hsn_no,flag) values(?,?,?,?,?,?,?)";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, itemDTO.getItemName());
			pstmt.setInt(2, itemDTO.getItemPrice());
			pstmt.setDouble(3, itemDTO.getCgst());
			pstmt.setDouble(4,itemDTO.getSgst());
			pstmt.setString(5, itemDTO.getManufacturer());
			pstmt.setString(6, itemDTO.getHsnNo());
			pstmt.setString(7, "Y");
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
	
	public ArrayList<ItemDTO> update(Integer batchNo) throws ClassNotFoundException, SQLException {
		String flag="Y";
			if(ItemOperations.getInstance().isFlag(batchNo)) {
				flag="N";
//				System.out.println(ItemOperations.getInstance().getItemList().get(4).getStatus());
			}
		Connection connection =null;
		PreparedStatement pstmt =null;
		Integer rowCount;
		String sql = "update item_table set flag=(?) where batch_no=(?)";
		
		try {
			connection = getConnection();
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, flag);
			pstmt.setInt(2, batchNo);
			rowCount = pstmt.executeUpdate();
			if(rowCount != 0) {
				return ItemOperations.getInstance().getItemList();
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
	public ArrayList<ItemDTO> view() throws ClassNotFoundException, SQLException {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemDTO> itemList = new ArrayList<>();
		String sql = "select batch_no,item_name , item_price, cgst , sgst , manufacturer, hsn_no,flag from item_table";
		try {
		connection =getConnection();
		pstmt = connection.prepareStatement(sql);
		rs =pstmt.executeQuery();
		while(rs.next()) {
			ItemDTO itemDTO = new ItemDTO();
			itemDTO.setBatchNo(rs.getInt("batch_no"));
			itemDTO.setItemName(rs.getString("item_name"));
			itemDTO.setItemPrice(rs.getInt("item_price"));
			itemDTO.setCgst(rs.getDouble("cgst"));
			itemDTO.setSgst(rs.getDouble("sgst"));
			itemDTO.setManufacturer(rs.getString("manufacturer"));
			itemDTO.setHsnNo(rs.getString("hsn_no"));
			itemDTO.setStatus(rs.getString("flag"));
			itemList.add(itemDTO);
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
		
		return itemList;
	}
}
