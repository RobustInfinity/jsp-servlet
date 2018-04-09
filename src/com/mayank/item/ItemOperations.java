package com.mayank.item;

import java.sql.SQLException;
import java.util.ArrayList;

public class ItemOperations {

	private  ArrayList<ItemDTO> itemList;
	private static ItemOperations itemOperations =null;
	
	private ItemOperations() {}
	
	public static ItemOperations getInstance() {
		if(itemOperations != null) {
			return itemOperations;
		}
		else {
			itemOperations = new ItemOperations();
			return itemOperations;
		}
	}
	public  ArrayList<ItemDTO> getItemList() throws ClassNotFoundException, SQLException  {
		ItemDAO itemDAO = new ItemDAO();
		this.itemList =  itemDAO.view();
		return itemList;
	}
	

	
			public boolean isFlag(Integer batchNo) throws ClassNotFoundException, SQLException {
				for(ItemDTO itemDTO : getItemList()) {
					if(itemDTO.getBatchNo().equals(batchNo)) {
						if(itemDTO.getStatus().equals("Y")) {
							return true;
						}
				}
			}
			return false;
		}
			
			//searching item by name
		public ArrayList<ItemDTO> search(String ItemName) throws ClassNotFoundException, SQLException {
			ArrayList<ItemDTO> searchItemList = new ArrayList<>();
			for(ItemDTO itemDTO : getItemList()) {
				if(itemDTO.getItemName().equals(ItemName) && isFlag(itemDTO.getBatchNo())) {
					searchItemList.add(itemDTO);
				}
			}
			return searchItemList;		
			}
			
		public ItemDTO search(Integer ItemBatchNo) throws ClassNotFoundException, SQLException {
			for(ItemDTO itemDTO : getItemList()) {
				if(itemDTO.getBatchNo().equals(ItemBatchNo) && isFlag(itemDTO.getBatchNo())) {
					return itemDTO;
				}
			}
			return null;	

		}
			
}
