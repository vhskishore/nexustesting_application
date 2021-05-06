<HTML>
<HEAD><TITLE>Staplerz Office Supplies Store</TITLE></HEAD>


<BODY>

<% System.out.println("within browsestore.jsp"); %>

<CENTER>
<FONT SIZE="6" COLOR="navy">Welcome To Staplerz</FONT>
<BR>
<FONT SIZE="4" COLOR="navy">Select The Categories You Want To Browse</FONT>
<BR>
</CENTER>


<FORM NAME="categories" ACTION="./browsecategories" METHOD="POST">

<TABLE WIDTH="75%" ALIGN="center" BGCOLOR="yellow">
	<TR><TD WIDTH="45%" ALIGN="right"><INPUT TYPE="checkbox" NAME="boxWriting" VALUE="writing"></TD>
		<TD WIDTH="55%">Writing Utensils</TD>
	</TR>
	<TR><TD ALIGN="right"><INPUT TYPE="checkbox" NAME="boxFurniture" VALUE="furniture"></TD>
		<TD>Furniture</TD>
	</TR>
	<TR><TD ALIGN="right"><INPUT TYPE="checkbox" NAME="boxPaper" VALUE="paper"></TD>
		<TD>Paper</TD>
	</TR>
	<TR><TD COLSPAN="2" ALIGN="center">
		<INPUT TYPE="submit" NAME="btnSubmit" VALUE="Retrieve Items"></TD>
	</TR>

</TABLE>
</FORM>

<BR><BR>
<HR>
Copyright Staplerz 2001
</BODY>
</HTML>