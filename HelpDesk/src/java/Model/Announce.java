package Model;

import java.sql.*;

public class Announce {
    private int announceId;
    private String announceTitle;
    private String announceDes;
    private String announceTime;

    public Announce(int announceId){
        this.announceId = announceId;
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement(
                "SELECT * "
                + "FROM Announce "
                + "WHERE AnnounceId = ? ");
            ps.setInt(1,announceId);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                announceId = result.getInt("AnnounceId");
                announceTitle = result.getString("announceTitle");
                announceDes = result.getString("announceDes");
                announceTime = result.getString("announceTime");
            }
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public int getAnnounceId() {
        return announceId;
    }
    public void setAnnounceId(int AnnounceId) {
        this.announceId = AnnounceId;
    }
    public String getAnnounceTitle() {
        return announceTitle;
    }
    public void setAnnounceTitle(String announceTitle) {
        this.announceTitle = announceTitle;
    }
    public String getAnnounceDes() {
        return announceDes;
    }
    public void setAnnounceDes(String announceDes) {
        this.announceDes = announceDes;
    }
    public String getAnnounceTime() {
        return announceTime;
    }
    public void setAnnounceTime(String announceTime) {
        this.announceTime = announceTime;
    }
    
    public static Announce getAnnounce(int announceId){
        Announce an = new Announce(announceId);
        return an;
    }
}
