package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	private final String severName = "localhost";
	private final String dbName = "ShoppingDB";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "khanhtran";
	private final String password = "123456";

	public Connection getConnection () throws Exception {
		String url = "jdbc:sqlserver://"+severName+":"+portNumber+"\\"+instance+";databaseName="+dbName;
		if(instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://"+severName+":"+portNumber+";databaseName="+dbName+";encrypt=false";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url,userID,password);
		
	}
}
