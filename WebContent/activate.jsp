
<%@page import="com.google.MailSender"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.Dbconn"%>
<%@page import="java.util.Random"%>
<%
try{
            String uname=request.getQueryString();
            Random r=new Random();
            int n=r.nextInt();
            String key=n+"";
            Connection con= Dbconn.getConnection();
            Statement st1=con.createStatement();
            ResultSet rt1 = st1.executeQuery("select email from user where username ='"+uname+"'");
          if(rt1.next()){
             String emailId=rt1.getString("email");
             new MailSender().sendMail(emailId, "User Account", " Activated");
          }
          else{
              out.println("gettin mail id failed");
          }
          Statement st=con.createStatement();
          st.executeUpdate("update user set accept='yes' where username='"+uname+"' ");
           int i=st.executeUpdate("insert into rights(token_, username_, upload_, update_, download_)values('"+key+"','"+uname+"','yes','yes','yes')"); 
          if(i!=0){
              //out.println("success..");
             response.sendRedirect("users_1.jsp?");
          }
          else{
              out.println("error while entering data");
          }
        } 
        catch(Exception e){
            out.println(e);
        }
%>