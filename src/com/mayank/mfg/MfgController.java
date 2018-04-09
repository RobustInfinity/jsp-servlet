package com.mayank.mfg;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MfgServlet
 */
@WebServlet("/manufacturer")
public class MfgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			ArrayList<MfgDTO> manufacturerList = MfgOperations.getInstance().getManufacturerList();
			request.setAttribute("manufacturerList", manufacturerList);
			RequestDispatcher rd = request.getRequestDispatcher("mfg-list.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String button =request.getParameter("button");
		if(button.equals("save")) {

			MfgDTO mfgDTO = new MfgDTO();
			mfgDTO.setCompanyName(request.getParameter("companyName"));
			mfgDTO.setContactNo(request.getParameter("contactNo"));
			mfgDTO.setSupervisor(request.getParameter("supervisor"));
			mfgDTO.setAddress(request.getParameter("address"));
			mfgDTO.setGstinNo(request.getParameter("gstin"));
			MfgDAO  mfgDAO = new MfgDAO();
			
			try {
				
					if(mfgDAO.add(mfgDTO)) {
						ArrayList<MfgDTO> manufacturerList;
						try {
							manufacturerList = MfgOperations.getInstance().getManufacturerList();
							request.setAttribute("manufacturerList", manufacturerList);
							RequestDispatcher rd = request.getRequestDispatcher("mfg-list.jsp");
							rd.forward(request, response);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					}
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}
		else {
			MfgDAO mfgDAO = new MfgDAO();
			
					ArrayList<MfgDTO> manufacturerList;
					try {
						manufacturerList = mfgDAO.update(Integer.valueOf(button));
						request.setAttribute("manufacturerList", manufacturerList);
						RequestDispatcher rd = request.getRequestDispatcher("mfg-list.jsp");
						rd.forward(request, response);
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}		
			
		}
	}
		
	}


