package Model;

import java.sql.*;
import java.util.ArrayList;

public class ReportProblem extends ProblemName{
    private long userId;
    private int roomId;
    private ArrayList<Problem> list;
    
    public ReportProblem(long userId){
        super();
        this.userId = userId;
        try{
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement(
                    "SELECT User.userId, Room.roomId "
                            + "FROM User "
                            + "INNER JOIN Renter ON User.userId = Renter.User_userId "
                            + "INNER JOIN Renter_has_Room ON Renter.renterId = Renter_has_Room.Renter_renterId "
                            + "INNER JOIN Room ON Renter_has_Room.Room_roomId = Room.roomId "
                            + "WHERE userId = ?");
            ps.setLong(1,userId);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                roomId = result.getInt("roomId");
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
        
        list = new ListProblem(userId).getList();
    }   
    
    public void report(int problemId){
        boolean have = false;
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getProblemId() == problemId) {
                have = true;
                break;
            }
        }
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps;
            int record;
            if (have) {
                int causeId = 0;
                int problemC = 0;
                int problemN = 0;
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getProblemId() == problemId) {
                        causeId = list.get(i).getCauseId();
                        problemC = list.get(i).getProblemC();
                        problemN = list.get(i).getProblemN();
                        break;
                    }
                }
                ps = connect.prepareStatement(
                        "UPDATE Cause "
                                + "SET status_statusId = ? "
                                + "WHERE causeId = ?");
                ps.setInt(1, 1);
                ps.setInt(2, causeId);
                record = ps.executeUpdate();
                ps.close();
                problemC += problemN;
                ps = connect.prepareStatement(
                        "UPDATE RecordProblem "
                                + "SET problemCurrent = ? , problemNow = ? "
                                + "WHERE = ?");
                ps.setInt(1,problemC);
                ps.setInt(2,1);
                ps.setInt(3,causeId);
                record = ps.executeUpdate();
                ps.close();
            }
            else {
                ps = connect.prepareStatement(
                        "INSERT INTO expense(expensesId , expensePrice , expenseDes )"
                                + "VALUES (null,null,null)");
                record = ps.executeUpdate();
                ps.close();
                ps = connect.prepareStatement(
                        "INSERT INTO Cause(causeId , expense_expensesId , Problem_problemId , status_statusId , Room_roomId)"
                                + "VALUES (null,(SELECT MAX(expensesId) FROM expense),?,?,?)");
                ps.setInt(1, problemId);
                ps.setInt(2, 1);
                ps.setInt(3, roomId);
                record = ps.executeUpdate();
                ps.close();
                ps = connect.prepareStatement(
                        "INSERT INTO RecordProblem(problemPast, problemCurrent, problemNow, Cause_causeId)"
                                + "VALUES (?, ?, ?, (SELECT MAX(causeId) FROM Cause))");
                ps.setInt(1, 00);
                ps.setInt(2, 00);
                ps.setInt(3, 1);
                record = ps.executeUpdate();
                ps.close();
            }
            list = new ListProblem(userId).getList();
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }  

    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public int getRoomId() {
        return roomId;
    }
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    public ArrayList<Problem> getList() {
        return list;
    }
    public void setList(ArrayList<Problem> list) {
        this.list = list;
    }   
    
    public static ReportProblem getReportProblem(long userId){      
        ReportProblem rp = new ReportProblem(userId);
        return rp;
    }
}
    


