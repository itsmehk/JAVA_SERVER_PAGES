

    <!DOCTYPE HTML>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.io.*" %>
        <html>

        <head>
        <title>Techie Tet | Mysql connectivity</title>
        </head>
        <body>
        <h1>Connection status </h1>
        <%
        try {
        String connectionURL = "jdbc:mysql://localhost:3306/companydb";
        Connection connection = null;
        // Load JBBC driver "com.mysql.jdbc.Driver"
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        /* user name = root
        password =ur mysql password. */
        connection = DriverManager.getConnection(connectionURL, "root", "himank@123");
        if(!connection.isClosed())
        %>
        <font size="+3" color="black"></b>
        <%
        out.println("Successfully connected to " + "MySQL server using TCP/IP..."+"<br />");
        out.println("Creating statement..."+"<br />");
        Statement stmt = connection.createStatement();
        String sql1,sql2,sql3;
        sql1 = "SELECT * FROM employee";
        ResultSet rs = stmt.executeQuery(sql1);
            //int ssn = rs.getInt("ssn");
        while(rs.next()){
            String fname = rs.getString("fname");
            String date=rs.getString("Bdate");
            String lname = rs.getString("lname");
            String sMinit =rs.getString("Minit");
            long ssn=rs.getLong("Ssn");
            String address=rs.getString("Address");
            String sex=rs.getString("Sex");
            int salary=rs.getInt("Salary");
            long sssn=rs.getLong("Super_ssn");
            int dno=rs.getInt("Dno");

            //Display values
            //System.out.print("SSN: " + ssn);
            out.print("<b>" + " First Name: " + "</b>"+ fname + " " + "<b>" + " Minit " + "</b>" + sMinit + " " );
            out.println("<b>" + "Last Name: "+ "</b>" + lname  + " " + "<b>" + " Ssn: " + "</b>" +ssn+" " + "<b>" + " Bdate: " + "</b>" +date+" " + "<b>" + " Address: " + "</b>"+address + " " + "<b>" + " Sex: " + "</b>"+sex + " " + "<b>" + " Salary: " + "</b>"+salary + " " + "<b>" + " Super_ssn: " + "</b>"+sssn + " " + "<b>" + " Dno: " + "</b>"+dno + "<br />");}
        rs.close();
        stmt.close();   
        connection.close();
        }
        catch(Exception ex){
        %>
        </font>
        <font size="+3" color="red"></b>
        <%
        out.println("Unable to connect to database."+ex);
        }
        %>
        </font>
        </body>
        </html>

