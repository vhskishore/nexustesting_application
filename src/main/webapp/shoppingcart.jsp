<HTML>
<HEAD><TITLE>Shopping Page</TITLE></HEAD>

<BODY>
<%@ page import="com.servlets.*" %>
<% System.out.println("within shoppingcart.jsp"); %>

<CENTER>
<FONT SIZE="6" COLOR="navy">Welcome To Staplerz</FONT>
<BR><BR>


<%
	Vector scitems = (Vector) session.getAttribute("cart");
	String name = request.getParameter("item");
	String price = request.getParameter("price");

	shoppingCartItem newItem = new shoppingCartItem();
	newItem.setName(name);
	newItem.setPrice(price);

	if (scitems == null)
	{
		out.print("Vector null<BR>added new element<BR>" + name);
		scitems = new Vector();
		scitems.addElement(newItem);
		session.setAttribute("cart", scitems);
	} else {
		out.print("Vector was not null<BR>added new element<BR>" + name);
		scitems.addElement(newItem);
		session.setAttribute("cart", scitems);
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