<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String mid;
	 int i;
%>

<%
	try{
	mid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from member_profile where mem_login_id='"+mid+"'");
%>
<HTML>
<HEAD>
<script>
  function validate() 
	{
            if(document.form1.mname.value=="")
			 {
			    alert(" please enter member name...");
				document.form1.mname.focus();
				return false;
			 }
            if(document.form1.mid.value=="")
			 {
			    alert(" please enter member ID...");
				document.form1.mid.focus();
				return false;
			 }
			 if(document.form1.pass.value=="")
	          {
				alert("Please enter the password ...");
				document.form1.pass.focus();
				 return false;
			  }
		    if(document.form1.pass.value.length<4)
	          {
			    alert("Password should be atleast 4 charecters");
                document.form1.pass.focus();
		        document.form1.pass.value="";
		        return false;
		      }
	        if(document.form1.pass.value!=document.form1.cpass.value)
		     {
               alert("Password and Confirm password should be same.");
               document.form1.cpass.focus();
               document.form1.cpass.value="";
		       return false;
		     }
            if(document.form1.mobile.value=="")
			 {
			    alert(" please enter Mobile number...");
				document.form1.mobile.focus();
				return false;
			 }
			if(isNaN(document.form1.mobile.value))
		    {  
			   alert("mobile number should be in digits.");
			   document.form1.mobile.focus();
			   document.form1.mobile.value="";
			   return false;
			}
		   if(document.form1.mobile.value.length!=10)
			 {
			    alert(" Mobile number should be 10 digits only...");
				document.form1.mobile.focus();
				return false;
			 }
           if(document.form1.email.value.indexOf("@")==-1)
		    {
               alert("Invalid email......");
			   document.form1.email.focus();
			   document.form1.email.value="";
               return false;
			}
		   if(document.form1.email.value.indexOf(".")==-1||document.form1.email.value.indexOf(".")==0)
		    {
               alert("Invalid email......");
			   document.form1.email.focus();
			   document.form1.email.value="";
			   return false;
			}
           if(document.form1.addr.value=="")
			 {
			    alert(" please enter Address...");
				document.form1.addr.focus();
				return false;
			 }
			
       return true;
	}   
  
</script>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body bgcolor="#BA00FF"><BR><BR>
<h2 align="center"><font color="purple">Update profile </font></h3>
<form action="mem_update.jsp">
<%
	if(rs.next())
	{
%>
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" color="maroon">Member Id</font></strong></td>
<td align="center"><input type=text name="mid" value=<%=mid%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Member Name:</font></strong></td>
     <td align="center"><input type=text name="mname" value=<%=rs.getString(3)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Password:</font></strong></td>
     <td align="center"><input type=password name="pass" value=<%=rs.getString(2)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Confirm Password:</font></strong></td>
     <td align="center"><input type=password name="cpass" value=<%=rs.getString(2)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Mobile:</font></strong></td>
     <td align="center"><input type=text name="mobile" value=<%=rs.getString(5)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Email ID</font></strong></td>
     <td align="center"><input type=text name="email" value=<%=rs.getString(4)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Address</font></strong></td>
     <td align="center"><input type=text name="addr" value=<%=rs.getString(6)%>></td>
</tr>

<%
	}
stmt.close();
con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<tr>
     <td colspan="2" align="center" ><input type="submit" value="SAVE" class="sub">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" ></td>
</tr>
</table>
</form>
</body></HTML>