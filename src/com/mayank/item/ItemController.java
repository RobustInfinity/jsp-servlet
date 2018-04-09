package com.mayank.item;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ItemController
 */
@WebServlet("/item")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("update")!=null) {
			String value = request.getParameter("update");
			try {
				ItemDTO itemDTO = ItemOperations.getInstance().search(Integer.valueOf(value));
				response.sendRedirect("item-list.jsp?item?item="+itemDTO);
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
		else {
			try {
				ArrayList<ItemDTO> itemList = ItemOperations.getInstance().getItemList();
				request.setAttribute("itemList", itemList);
				RequestDispatcher rd = request.getRequestDispatcher("item-list.jsp");
				rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}






	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button =request.getParameter("button");
		if(button.equals("save")) {
			ItemDTO itemDTO = new ItemDTO();
			itemDTO.setItemName(request.getParameter("itemName"));
			itemDTO.setItemPrice(Integer.valueOf(request.getParameter("itemPrice")));
			itemDTO.setCgst(Double.valueOf(request.getParameter("cgst")));
			itemDTO.setSgst(Double.valueOf(request.getParameter("sgst")));
			itemDTO.setManufacturer(request.getParameter("manufacturer"));
			itemDTO.setHsnNo(request.getParameter("hsnNo"));
			ItemDAO itemDAO = new ItemDAO();
			
			try {
				
					if(itemDAO.add(itemDTO)) {
						ArrayList<ItemDTO> itemList;
						try {
							itemList = ItemOperations.getInstance().getItemList();
							request.setAttribute("itemList", itemList);
							RequestDispatcher rd = request.getRequestDispatcher("item-list.jsp");
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
			ItemDAO itemDAO = new ItemDAO();
			try {
				ArrayList<ItemDTO> itemList = itemDAO.update(Integer.valueOf(button));
				request.setAttribute("itemList", itemList);
				RequestDispatcher rd = request.getRequestDispatcher("item-list.jsp");
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
//		if(request.getParameter("update")!=null) {
//			
//		}
	}

	}
	


