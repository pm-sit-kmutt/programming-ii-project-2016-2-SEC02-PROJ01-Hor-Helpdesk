package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ListAnnounce {
    private long userId;
    private String status;
    private ArrayList<Announce> list;
    
    public ListAnnounce() {
        list = new ArrayList<Announce>();
    }
    
    public ListAnnounce(long userId) {
        this();
        this.userId = userId;
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement("SELECT userType FROM User WHERE userId = ?");
            ps.setLong(1,userId);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                status = result.getString("userType");
            }
            ps.close();
            if(status.equalsIgnoreCase("student")){
                ps = connect.prepareStatement(
                        "SELECT User.userId, Room.roomNo, Domitory.dormId, Announce.AnnounceId "
                                 + "FROM User "
                                + "INNER JOIN Renter ON User.userId = Renter.User_userId "
                                + "INNER JOIN Renter_has_Room ON Renter.renterId = Renter_has_Room.Renter_renterId "
                                + "INNER JOIN Room ON Renter_has_Room.Room_roomId = Room.roomId "
                                + "INNER JOIN Domitory ON Room.Dormitory_dormId = Domitory.dormId "
                                + "INNER JOIN Announce ON Domitory.dormId = Announce.Domitory_dormId "
                                + "WHERE User.userId = ? " );
            }
            else {
                ps = connect.prepareStatement(
                        "SELECT User.userId, Dormitory.dormId, Announce.AnnounceId "
                                + "FROM User "
                                + "INNER JOIN Dormitory ON User.userId = Dormitory.User_userId "
                                + "INNER JOIN Announce ON Dormitory.dormId = Announce.Dormitory_dormId "
                                + "WHERE userId = ? " );
            }
            ps.setLong(1,userId);
            result = ps.executeQuery();
            while(result.next()){
                list.add(new Announce(result.getInt("AnnounceId"));
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

    public ArrayList<Announce> getList() {
        return list;
    }

    public void setList(ArrayList<Announce> list) {
        this.list = list;
    }
    
    public static ListAnnounce getListAnnounce(long userId){
       ListAnnounce an = new ListAnnounce(userId);
       return an;
   }
}