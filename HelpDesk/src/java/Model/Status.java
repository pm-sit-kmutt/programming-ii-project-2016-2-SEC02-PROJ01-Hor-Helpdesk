package Model;

import java.sql.*;
import java.util.ArrayList;

public class Status {
    private ArrayList<String> statusName;
    
    public Status() {
        statusName = new ArrayList<String>();
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement("SELECT statusName FROM status");       
            ResultSet result = ps.executeQuery();           
            while(result.next()){
                statusName.add(result.getString("statusName"));
            }
            ps.close();
            connect.close();
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> getStatusName() {
        return statusName;
    }
    public void setStatusName(ArrayList<String> statusName) {
        this.statusName = statusName;
    }
}
