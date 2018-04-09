package com.mayank.index;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mayank.item.ItemDTO;
import com.mayank.item.ItemOperations;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String message="No result found.";
		try {
			ArrayList<ItemDTO> searchItemList = ItemOperations.getInstance().search(search);
			if(searchItemList.size() !=0) {
				request.setAttribute("searchItemList", searchItemList);
			}
			else {
				request.setAttribute("message", message);
			}
			RequestDispatcher rd = request.getRequestDispatcher("item-list.jsp");
			request.setAttribute("search", search);
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
		
	}

}
