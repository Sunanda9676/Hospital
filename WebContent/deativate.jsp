
<%@page import="com.google.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
 try {
            String uname=request.getQueryString();
            
           Connection con= Dbconn.getConnection();  
           Statement st1=con.createStatement();
           
              st1.execute("delete from rights where username_='"+uname+"'");
           int i=st1.executeUpdate("update user set accept='no' where username='"+uname+"'");
           if(i!=0){
               response.sendRedirect("users_1.jsp");
           }
           else{
               out.println("error while updating");
           }
        }
        catch(Exception e){
            out.println(e);
        }
%>