<HTML>
<HEAD><TITLE>Shopping Page</TITLE></HEAD>

<BODY>
<%@ page import="com.servlets.shoppingCartItem" %>
<% System.out.println("within viewshoppingcart.jsp"); %>

<CENTER>
<FONT SIZE="6" COLOR="navy">Welcome To Staplerz</FONT>
<BR><BR>


<%
	Vector scitems = (Vector) session.getAttribute("cart");
	if (scitems == null)
	{
		out.print("Vector was null");
		out.print("Nothing in shopping cart");
	} else {
		out.print("Vector was not null");
		Enumeration enum = scitems.elements();
		while (enum.hasMoreElements())
		{
			shoppingCartItem item = (shoppingCartItem) enum.nextElement();
			out.print(item.getName());
		}
	}


%>


<BR>

<A HREF="./welcome.jsp">Back To The Home Page</A>
<BR>
</CENTER>
<BR><BR>
<HR>
Copyright Staplerz 2001
</BODY>
</HTML>