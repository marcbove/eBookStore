<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%!
private List<String> resetDatabase(boolean force) throws Exception {
        LinkedList<String> messages = new LinkedList();
        /* How to customize:
         * 1. Update the database name on dbname.
         * 2. Create the list of tables, under tablenames[].
         * 3. Create the list of table definition, under tables[].
         * 4. Create the data into the above table, under data[].
         *
         * If there is any problem, it will exit at the very first error.
         */
        String dbname = "BookStoreBD";
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        /* this will generate database if not exist */
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/" + dbname + ";create=true", "sob", "sob");
        Statement stmt = con.createStatement();

        try {
            stmt.execute("CREATE SCHEMA " + dbname);
            // schema was created; it will appear into: Other schemas -> "dbname"
        } catch (SQLException e) {
            // schema already exists; do nothing.
            if (!force) {
                messages.add("Database exists. Doing nothing. Visit install.jsp on your browser to reset your database content.");
                return messages;
            }
        }


        dbname = "SOB";

        //drop tables if they exist
        String tablenames[] = new String[]{
            "BOOK", "BOOKORDER", "CUSTOMER"};
        for (String tablename : tablenames) {
            try {
                stmt.executeUpdate("DROP TABLE " + dbname + "." + tablename);
                messages.add("<pre> -> DROP TABLE " + dbname + "." + tablename + "<pre>");
            } catch (SQLException e) {
                System.out.println("DONT EXIST TABLES");
                // table didn't exist; it is the first time
            }
        }

        //creating tables
        String tables[] = new String[]{

        /*
            "CREATE TABLE " + dbname + ".PROFESSOR ("
            + " IDPROF INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),"
            + " USUARI VARCHAR(25) NOT NULL,"
            + " PASS VARCHAR (25) NOT NULL,"
            + " NOM VARCHAR (25))",

        */
            "CREATE TABLE " + dbname + " .BOOK (BOOK_ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), RATING INT, DESCRIPTION VARCHAR(240), COVER VARCHAR(240), PRICE FLOAT, NAME VARCHAR(40), AUTHOR VARCHAR(40), STOCK INT)",
            "CREATE TABLE " + dbname + " .BOOKORDER (ORDER_ID  INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), CUSTOMER_ID INT)",
            "CREATE TABLE " + dbname + " .CUSTOMER (CUSTOMER_ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), PHONE VARCHAR(12), EMAIL VARCHAR(40), NAME VARCHAR(25), PASSWORD VARCHAR(25))"
        };

        for (String table : tables) {
            try {
                stmt.execute(table);
            } catch (SQLException e) {
                messages.add("<span class='error'>Error creating table: "+table+" </span>");
                return messages;
            }
            messages.add("<pre> -> "+table+" <pre>");
        }




        //inserting data
        //you have to exclude the id autogenerated from the list of columns if you have use it.

        String data[] = new String[]{
            "INSERT INTO " + dbname + ".CUSTOMER(PHONE, EMAIL, NAME) VALUES ('123456789', 'sob@sob.com', 'sob')",

            "INSERT INTO " + dbname + ".BOOK(RATING, DESCRIPTION, COVER, PRICE, NAME, AUTHOR, STOCK) VALUES (3, 'qwerty', '', 5.0, 'qwertyuiop', 'TBD', 1)",
            "INSERT INTO " + dbname + ".BOOK(RATING, DESCRIPTION, COVER, PRICE, NAME, AUTHOR, STOCK) VALUES (4, 'WASD', '', 15.0, 'GAMING_WASD', 'TBD', 3)"
        };

        for (String datum : data) {
            if (stmt.executeUpdate(datum) <= 0) {
                messages.add("<span class='error'>Error inserting data: " + datum + "</span>");
                return messages;
            }
            messages.add("<pre> -> " + datum + "<pre>");
        }

        return messages;

    }

    public void jspInit() {
        try {
            List<String> messages = resetDatabase(false);
            for (String message : messages) {
                System.out.println("install.jsp: " + message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Force database installation</title>
    </head>
    <style>
        .error {
            color: red;
        }
        pre {
            color: green;
        }
    </style>
    <body>
        <h2>Database initialization in progress</h2>
<%
    List<String> messages = resetDatabase(true);
    for (String message : messages) {
        out.println(message);
    }
%>
        <button onclick="window.location='<%=request.getSession().getServletContext().getContextPath()%>'">Go home</button>
    </body>
</html>
