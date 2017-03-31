package Model;

import java.sql.*;

public class User {
    private long userId = 0;
    private String status;
    
    public User() {
    }
    public User(long userId){
        this.userId = userId;
        if(userId > 0){
            try {
                Connection connect = ConnectionBuilder.getConnection();
                PreparedStatement ps = connect.prepareStatement("SELECT userType FROM User WHERE userId = ?");
                ps.setLong(1, userId);
                ResultSet result = ps.executeQuery();
                while(result.next()){
                    status = result.getString("userType");
                }
                ps.close();
                connect.close();
            }
            catch(SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            catch(Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", status=" + status + '}';
    }

}
