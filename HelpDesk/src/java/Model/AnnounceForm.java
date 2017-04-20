package Model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AnnounceForm {
    private int AnnounceId;
    private String announceTitle;
    private String announceDes;
    private Date announceTime;

    public AnnounceForm() {

    }

    public AnnounceForm(String announceTitle, String announceDes) {
        this.announceTitle = announceTitle;
        this.announceDes = announceDes;
    }

    public boolean addAnnounce(){
        try {
            Connection cn = ConnectionBuilder.getConnection();
            String sqlCmd = "INSERT INTO Announce(announceTitle,announceDes,announceTime)VALUES(?,?,?)" ;
            PreparedStatement ps = cn.prepareStatement(sqlCmd) ;
            ps.setString(1,announceTitle);
            ps.setString(2, announceDes);
            ps.setDate(3,new java.sql.Date(System.currentTimeMillis()));
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AnnounceForm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public int getAnnounceId() {
        return AnnounceId;
    }

    public void setAnnounceId(int AnnounceId) {
        this.AnnounceId = AnnounceId;
    }

    public String getAnnounceTitle() {
        return announceTitle;
    }

    public void setAnnounceTitle(String AnnounceTitle) {
        this.announceTitle = announceTitle;
    }

    public String getAnnounceDes() {
        return announceDes;
    }

    public void setAnnounceDes(String AnnounceDes) {
        this.announceDes = announceDes;
    }

    public Date getAnnounceTime() {
        return announceTime;
    }

    public void setAnnounceTime(Date AnnounceTime) {
        this.announceTime = announceTime;
    }
    
    public static void main(String[] args) {
        AnnounceForm a = new AnnounceForm("virada", "announceDes");
        System.out.println(a.addAnnounce());
    }
}
