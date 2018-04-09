package com.mayank.mfg;

import java.sql.SQLException;
import java.util.ArrayList;

public class MfgOperations {
	
	private static MfgOperations mfgOperations = null;
	private ArrayList<MfgDTO> manufacturerList;
	private MfgOperations() {}
	
	public static MfgOperations getInstance() {
		if(mfgOperations != null) {
			return mfgOperations;
		}
		else {
			mfgOperations = new MfgOperations();
			return mfgOperations;
		}
	}
	
	public ArrayList<MfgDTO> getManufacturerList() throws ClassNotFoundException, SQLException {
		MfgDAO mfgDAO = new MfgDAO();
		this.manufacturerList = mfgDAO.view();
		return manufacturerList;
	}
	
	public boolean isFlag(Integer companyNo) throws ClassNotFoundException, SQLException {
		for(MfgDTO mfgDTO : getManufacturerList()) {
			if(mfgDTO.getCompanyNo().equals(companyNo)) {
				if(mfgDTO.getStatus().equals("Y")) {
					return true;
				}
		}
	}
	return false;
	}
}
