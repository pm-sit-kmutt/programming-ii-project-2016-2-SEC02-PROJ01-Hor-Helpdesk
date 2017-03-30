package Model;

import java.sql.*;
import java.util.ArrayList;

public class ProblemName {
     private ArrayList<String> problemName;
     
     public ProblemName(){
        problemName = new ArrayList<String>();
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement("SELECT problemName FROM Problem");       
            ResultSet result = ps.executeQuery();           
            while(result.next()){
                problemName.add(result.getString("problemName"));
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

    public ArrayList<String> getProblemName() {
        return problemName;
    }

    public void setProblemName(ArrayList<String> problemName) {
        this.problemName = problemName;
    }
         
}   

