package appDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.Transaction;
import beans.User;

public class TransDao {

	public int storeTransert(Transaction trans) throws SQLException
    {
        int result = 0;
        Connection con = DbConnection.getConnection() ;

        String sql = "insert into transaction (transid, accnumber, amount, trantype) values (?,?,?,?)";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setInt(1, trans.getTransId());
            preparedStatement.setInt(2, trans.getAccNumber());
            preparedStatement.setInt(3, trans.getAmount());
            preparedStatement.setString(4, trans.getTranType());
            
            result = preparedStatement.executeUpdate();
            con.close();
            
          } catch (SQLException e) {
            e.printStackTrace();
          }    
        return result;
    }
	
	
}
