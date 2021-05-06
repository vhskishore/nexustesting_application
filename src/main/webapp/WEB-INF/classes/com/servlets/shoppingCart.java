package com.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;

public class shoppingCart extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		System.out.println("within shopping cart servlet");

		response.setContentType("text/html");
		ServletOutputStream out = response.getOutputStream();
		out.print("<HTML><HEAD><TITLE>Supply Categories</TITLE></HEAD>");
		out.print("<BODY><CENTER>");



		out.print("<FONT SIZE='6' COLOR='navy'>Welcome To Staplerz</FONT><BR>");

		out.print("<FONT SIZE='4' COLOR='navy'>");

		HttpSession session = request.getSession(true);
		Vector scitems = (Vector) session.getAttribute("cart");
		String name = request.getParameter("item");
		String price = request.getParameter("price");

		shoppingCartItem newItem = new shoppingCartItem();
		newItem.setName(name);
		newItem.setPrice(price);

		if (scitems == null)
		{
			out.print("added new element<BR>" + name);
			System.out.println("added new element: " + name);
			scitems = new Vector();
			scitems.addElement(newItem);
			session.setAttribute("cart", scitems);

		} else {
			out.print("<BR>added new element<BR>" + name);
			System.out.println("added new element: " + name);
			scitems.addElement(newItem);
			session.setAttribute("cart", scitems);
		}



		out.print("</FONT>");
		out.print("<BR><A HREF='./welcome.jsp'>Back To Home Page</A><BR>");
		out.print("</CENTER><HR>Copyright Staplerz 2001");
		out.print("</BODY></HTML>");

	}


}