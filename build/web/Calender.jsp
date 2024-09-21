<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="utf-8">

	<title>POCKET DESK</title>

	<link rel="stylesheet" href="calendar.css" media="screen">

	<style type="text/css">body{background:url(bg.png) repeat;width:960px;margin:0 auto}.footer{margin-top:100px;text-align:center;color:#666;font:bold 14px Arial}.footer a{color:#999;text-decoration:none}#wrapper{padding: 50px 0 0 325px;}#calendar{margin:25px auto; width: 370px;}</style>
<meta name="robots" content="noindex,follow" />
</head>

<body>

<h1 align="center">POCKET DESK</h1>
<h2 style="float:right;margin-top:-35px;margin-right:25px"><a href="1_HomePage.jsp"><button class="b2">Back to home</button></a></h2>


<div id="calendar"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="jquery-ui-datepicker.min.js"></script>
<script>
	$('#calendar').datepicker({
		inline: true,
		firstDay: 1,
		showOtherMonths: true,
		dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
	});
</script>
<style>
    .b2{
                        background-color:blueviolet; /* Green */
                        border: none;
                        color: white;
                        height:35px;
                        width:80px;
                        border-radius: 30px;
                        cursor: pointer;}

    .b3{
                        background-color:brown; /* Green */
                        border: none;
                        color: white;
                        height:35px;
                        width:80px;
                        border-radius: 30px;
                        cursor: pointer;}

</style>
                <%
try{

       String userid=(String)session.getAttribute("user_id");
       

Class.forName("com.mysql.jdbc.Driver");
//String s=request.getParameter("username");
   String sql="select * from networks_master where user_id = ?";
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pocketdesk","root","root");

PreparedStatement ps=con.prepareStatement(sql);
                               ps.setString(1,userid);
   ResultSet rs=ps.executeQuery();
 %>
 <h3 align="center">To view Tasks Select the Network</h3>
 <select name="nw_name" required="required" style= " font-size: 15px; margin-left:370px; margin-bottom: -125px;height:38px; width: 200px;" >
                        <option value="">Select the Network</option> 
                       <%
         while(rs.next()){
       %>
       <option><%=rs.getString("network_id")%></option>
        <%
        }
        %>
        
                    </select>
        <h4 align="center"><a href="Tasks_managers.jsp"><button class="b3">VIEW</button></a></h4>
      <%     con.close();
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
          %> 
               


</body>

</html>