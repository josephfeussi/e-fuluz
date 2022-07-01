package appDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.User;



public class AppDao {
	
	public User checkLogin(int num, String pwd) throws SQLException
    {
        Connection con = DbConnection.getConnection() ;

        String sql = "SELECT * FROM user WHERE accnumber = ? and password = ?";  
        User user = null;
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setInt(1, num);
            preparedStatement.setString(2, pwd);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                user = new User();
                user.setAccNumber(resultSet.getInt(3));
	            user.setBalance(resultSet.getInt(5));
	            user.setNom(resultSet.getString(1));
	            user.setPrenom(resultSet.getString(2));
	            user.setPassword(resultSet.getString(4));
	            user.setIsadmin(resultSet.getInt(6));
            }
            
            con.close();
            
          } catch (SQLException e) {
            e.printStackTrace();
          } 
        return user;
    }
	
	public int addUser(User user) throws SQLException
    {
        int result = 0;
        Connection con = DbConnection.getConnection() ;

        String sql = "insert into user (nom ,prenom,accnumber,password,balance) values (?,?,?,?,0) ";
        
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, user.getNom());
            preparedStatement.setString(2, user.getPrenom());
            preparedStatement.setInt(3, user.getAccNumber());
            preparedStatement.setString(4, user.getPassword());
            
            result = preparedStatement.executeUpdate();
            con.close();
            
          } catch (SQLException e) {
            e.printStackTrace();
          }    
        return result;
    }
	
	public  int updateUser(User user) throws SQLException
	    {
	        int result = 0;
	        Connection con = DbConnection.getConnection() ;
	        
	        PreparedStatement preparedStatement  = con.prepareStatement(
	                "update user set nom=?,prenom=?, password=?  where accnumber=?");
	        
	        preparedStatement.setString(1, user.getNom());
	        preparedStatement.setString(2, user.getPrenom());
	        preparedStatement.setString(3, user.getPassword());  
	        preparedStatement.setInt(4, user.getAccNumber());
	        
	        result = preparedStatement.executeUpdate();
	        
	        // close the database connection
	        con.close();
	        return result;
	    }
	
	public  int deleteUser(int id) throws SQLException
    {
        int result = 0;
        
        Connection con = DbConnection.getConnection() ;        

        PreparedStatement preparedStatement = con.prepareStatement(
                "delete from user where accnumber =?");
        // set the integer value to the  user id,
        preparedStatement.setInt(1, id);
        
        result = preparedStatement.executeUpdate();
        
        // close the database connection
        con.close();
        
        return result;
    }
	
	
	public static User getUserById(int id)
	        throws SQLException
	    {
	        User user = new User();
	        
	        // create connection at the call of the method
	        Connection con = DbConnection.getConnection() ;        
	        
	        PreparedStatement preparedStatement = con.prepareStatement("select * from USER where accnumber=?");
	        
	        preparedStatement.setInt(1, id);        
	        ResultSet resultSet  = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            user.setAccNumber(resultSet.getInt(3));
	            user.setBalance(resultSet.getInt(5));
	            user.setNom(resultSet.getString(1));
	            user.setPrenom(resultSet.getString(2));
	            user.setPassword(resultSet.getString(4));
	        }
	        con.close();
	        return user;
	    }
	
	public List<User> getAllUsers()throws SQLException
		{
			List<User> list = new ArrayList<User>();
			
			// create connection at the call of the method
			Connection con = DbConnection.getConnection() ;
			
			PreparedStatement preparedStatement= con.prepareStatement( "select * from user");
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				User user = new User();
				user.setAccNumber(resultSet.getInt(3));
	            user.setBalance(resultSet.getInt(5));
	            user.setNom(resultSet.getString(1));
	            user.setPrenom(resultSet.getString(2));
	            user.setPassword(resultSet.getString(4));
				// store the values into the list
				list.add(user);
			}
			con.close();
			return list;
		}
	
	
	public User checkBalance(int id)throws SQLException
	    {
	        User user = new User();
	        
	        // create connection at the call of the method
	        Connection con = DbConnection.getConnection() ;        
	        
	        PreparedStatement preparedStatement = con.prepareStatement("select * from user where accnumber=?");
	        
	        preparedStatement.setInt(1, id);        
	        ResultSet resultSet  = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            user.setAccNumber(resultSet.getInt(3));
	            user.setBalance(resultSet.getInt(5));
	            user.setNom(resultSet.getString(1));
	            user.setPrenom(resultSet.getString(2));
	            user.setPassword(resultSet.getString(4));
	        }
	        con.close();
	        return user;
	    }
	
	public int addMoney(int id, int amount)throws SQLException
    {
		int result = 0;
        Connection con = DbConnection.getConnection() ;
        
        PreparedStatement preparedStatement  = con.prepareStatement(
                "update user set balance=? where accnumber=?");
        
        preparedStatement.setInt(1, amount);
        preparedStatement.setInt(2, id);
        
        result = preparedStatement.executeUpdate();
        
        // close the database connection
        con.close();
        return result;
    }

}
