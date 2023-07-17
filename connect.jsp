<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<% 
    String roll = request.getParameter("roll");
    String name = request.getParameter("name");
    String add = request.getParameter("add");

    try{
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/db123","postgres","Hola@2022");

        String sql = "INSERT INTO form123 (roll,name, add) VALUES (?,?,?)";
        PreparedStatement statement = conn.prepareStatement(sql);
    
        statement.setString(1,roll);
        statement.setString(2,name);
        statement.setString(3,add);
        statement.executeUpdate();
        if(x>0){
            out.println("submitted successfully")
        }
    } 
    catch(Exception e){
        e.printStackTrace();
    }finally {
        try {
            if (conn != null) {
                conn.close();
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }

%>


        // Database connection
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(dbURL, username, password);

            // Insert data into table
            String sql = "INSERT INTO your_table (name, email) VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.executeUpdate();
            statement.close();

            // Display success message
            out.println("<h1>Data inserted successfully!</h1>");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any errors
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                    // Connection closed successfully
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Handle any errors
            }
        }
    %>
</body>
</html>
