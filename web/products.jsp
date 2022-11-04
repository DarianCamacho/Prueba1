<%-- 
    Document   : products
    Created on : 3 nov. 2022, 13:25:14
    Author     : delga
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Products</title>
    </head>
    <body>
        <%!
            Connection con;
            ResultSet resultset;

            public void jspInit() {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                    Statement statement = con.createStatement();
                    resultset = statement.executeQuery("select * from products");
                } catch (Exception ex)
                {
                    ex.printStackTrace();
                }
            }

            public void jspDestroy() {
                try {
                    con.close();
                } catch (Exception ex)
                {
                    ex.printStackTrace();
                }
            }

        %>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.jsp">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>                       
        <div class="container" style="margin-top:2%"> 
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next())  {%>
                         <tr>
                             <th scope="row"> <%=resultset.getInt("Id")%> </th>
                             <td><%=resultset.getString("Name")%></td>
                             <td><%=resultset.getString("Category")%></td>
                             <td><%=resultset.getInt("Price")%></td>                        
                             <td><%=resultset.getString("Date")%></td>                                                                    
                        </tr>                    
                    <%}%>
                </tbody>
            </table>   
        </div>
    </body>
</html>
