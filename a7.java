import java.sql.*;
class a7{
	public static void main(String[] args) {
		Class.forName("com.mysql.jdbc.Driver");
		static final String USER = "username";
		static final String PASS = "password";
		System.out.println("Connecting to database...");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		System.out.println("Creating statement...");
		stmt = conn.createStatement();
		String sql;
		sql = "SELECT fname, minit, lname FROM Employee";
		ResultSet rs = stmt.executeQuery(sql);
		int ssn = rs.getInt("ssn");
		String fname = rs.getString("fname");
		String last = rs.getString("lname");
		//Display values
		System.out.print("SSN: " + ssn);
		System.out.print(", First Name: " + fname);
		System.out.println(", Last Name: " + lname);
		rs.close();
		stmt.close();
		conn.close(); }
}