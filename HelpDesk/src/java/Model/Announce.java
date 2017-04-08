package Model;

import java.sql.*;


public class Announce {
    private int AnnounceId;
    private String AnnounceTitle;
    private String AnnounceDes;
    private String AnnounceTime;

    public Announce() {
    }
    
    
    public Announce(int AnnounceId){
        this.AnnounceId=AnnounceId;
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement(
                    "SELECT AnnounceId , AnnounceTitle, AnnounceDes , AnnounceTime  "
                            + "FROM Announce "
                            
                            + "WHERE AnnounceId = ? ");
            ps.setInt(1,AnnounceId);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                AnnounceId = result.getInt("AnnounceId");
                AnnounceTitle = result.getString("AnnounceTitle");
                AnnounceDes = result.getString("AnnounceDes");
                AnnounceTime = result.getString("AnnounceTime");
                
            }
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public int ListAnnounce() {
        return AnnounceId;
    }

    public void setAnnounceId(int AnnounceId) {
        this.AnnounceId = AnnounceId;
    }

    public String getAnnounceTitle() {
        return AnnounceTitle;
    }

    public void setAnnounceTitle(String AnnounceTitle) {
        this.AnnounceTitle = AnnounceTitle;
    }

    public String getAnnounceDes() {
        return AnnounceDes;
    }

    public void setAnnounceDes(String AnnounceDes) {
        this.AnnounceDes = AnnounceDes;
    }

    public String getAnnounceTime() {
        return AnnounceTime;
    }

    public void setAnnounceTime(String AnnounceTime) {
        this.AnnounceTime = AnnounceTime;
    }
    public static  Announce getAnnounce(int AnnounceId){
        Announce an = new Announce(AnnounceId);
        return an;
    }
    public static  Announce getAnnounce(){
        Announce an = new Announce();
        return an;
    }
}
    
    

