<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">

            function noBack()
            {
                window.history.forward();
            }
        </script>
    </head>
    <body onLoad="noBack();" onpageshow="if(event.presisted) noBack();" onunload="">
        <%
        String admin_member = request.getParameter("admin_member");
        String nw_nameS = (String) session.getAttribute("network_name");
         
         try {
        

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/pocketdesk", "root", "root");

        PreparedStatement ps
                = con.prepareStatement("insert into networkadmins_master (network_name,user_id) values(?,?)");

         ps.setString(1,nw_nameS);
         ps.setString(2,admin_member);

        int count = ps.executeUpdate();
        if (count > 0) { 
            System.out.println("Admin Added");
            response.sendRedirect("AlertMemberAdmin.jsp");
        }
        con.close();
    } catch (Exception ex) {
        System.out.println(ex);
        ex.printStackTrace();
    }
        %>
    </body>
</html>
