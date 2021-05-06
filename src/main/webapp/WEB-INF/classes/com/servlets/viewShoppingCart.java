package com.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class viewShoppingCart extends HttpServlet
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		System.out.println("within viewShoppingCart servlet");

		response.setContentType("text/html");
		ServletOutputStream out = response.getOutputStream();
		out.print("<HTML><HEAD><TITLE>Supply Categories</TITLE></HEAD>");
		out.print("<BODY><CENTER>");



		out.print("<FONT SIZE='6' COLOR='navy'>Welcome To Staplerz</FONT><BR>");

		out.print("<FONT SIZE='4' COLOR='navy'>");


		HttpSession session = request.getSession(true);

		Vector scitems = (Vector) session.getAttribute("cart");
		if (scitems == null)
		{

			out.print("Nothing in shopping cart<BR><BR>");
		} else {

			Enumeration enum = scitems.elements();

			out.print("<BR><TABLE WIDTH='75%' BGCOLOR='yellow'>");
			out.print("<TR><TD>Item</TD><TD>Price</TD></TR>");
			System.out.println("Your shopping cart includes: ");

			while (enum.hasMoreElements())
			{
				shoppingCartItem item = (shoppingCartItem) enum.nextElement();

				out.print("<TR><TD>" + item.getName() + "</TD><TD>" + item.getPrice() + "</TD></TR>");
				System.out.println("\tItem: " + item.getName() + " price: " + item.getPrice());
			}

			out.print("</TABLE>");
		}



		out.print("</FONT>");
		out.print("<BR><A HREF='./shopping.jsp'>Back To The Shopping Page</A><BR>");
		out.print("<BR><A HREF='./welcome.jsp'>Back To Home Page</A><BR>");
		out.print("</CENTER><HR>Copyright Staplerz 2001");
		out.print("</BODY></HTML>");

	}


}