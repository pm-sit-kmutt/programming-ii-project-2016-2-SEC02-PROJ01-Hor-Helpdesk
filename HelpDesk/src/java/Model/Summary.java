package Model;

import java.util.ArrayList;

public class Summary extends ProblemName{
    private long userId;
    private int[] past;
    private int[] maxPast;
    private ArrayList<Integer>[] roomMaxPast;
    private int[] current;
    private int[] maxCurrent;
    private ArrayList<Integer>[] roomMaxCurrent;

    public Summary(long userId) {
        super();
        this.userId = userId;
        past = new int[27];
        for (int i = 0; i < past.length; i++) {
            past[i] = 0;
        }
        maxPast = new int[27];
        for (int i = 0; i < past.length; i++) {
            maxPast[i] = 0;
        }
        roomMaxPast = new ArrayList[27];
        for (int i = 0; i < roomMaxPast.length; i++) {
            roomMaxPast[i] = new ArrayList<Integer>();
            roomMaxPast[i].add(0);
        }
        current = new int[27];
        for (int i = 0; i < past.length; i++) {
            current[i] = 0;
        }
        maxCurrent = new int[27];
        for (int i = 0; i < past.length; i++) {
            current[i] = 0;
        }
        roomMaxCurrent = new ArrayList[27];
        for (int i = 0; i < roomMaxCurrent.length; i++) {
            roomMaxCurrent[i] = new ArrayList<Integer>();
            roomMaxCurrent[i].add(0);
        }
        
        ArrayList<Problem> list = new ListProblem(userId).getList();
        
        for (int i = 0; i < list.size(); i++) {
            int index = (list.get(i).getProblemId())-1;
            past[index] += list.get(i).getProblemP();
            if(maxPast[index] <= list.get(i).getProblemP()) {
                int change = 0;
                if (maxPast[index] < list.get(i).getProblemP()) {
                    maxPast[index] = list.get(i).getProblemP();
                    change++;
                }
                if (list.get(i).getProblemP() != 0) {
                    if (roomMaxPast[index].get(0) == 0 || change > 0) {
                        roomMaxPast[index].remove(0);
                    }
                    roomMaxPast[index].add(list.get(i).getRoom());
                }
                change = 0;
            }
            current[index] += list.get(i).getProblemC();
            if(maxCurrent[index] <= list.get(i).getProblemC()) {
                int change = 0;
                if (maxCurrent[index] < list.get(i).getProblemC()) {
                    maxCurrent[index] = list.get(i).getProblemC();
                    change++;
                }
                if (list.get(i).getProblemC() != 0) {
                    if (roomMaxCurrent[index].get(0) == 0 || change > 0) {
                        roomMaxCurrent[index].remove(0);
                    }
                    roomMaxCurrent[index].add(list.get(i).getRoom());
                }
                change = 0;
            }
        }
    }

    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public int[] getPast() {
        return past;
    }
    public void setPast(int[] past) {
        this.past = past;
    }
    public int[] getMaxPast() {
        return maxPast;
    }
    public void setMaxPast(int[] maxPast) {
        this.maxPast = maxPast;
    }
    public ArrayList<Integer>[] getRoomMaxPast() {
        return roomMaxPast;
    }
    public void setRoomMaxPast(ArrayList<Integer>[] roomMaxPast) {
        this.roomMaxPast = roomMaxPast;
    }
    public int[] getCurrent() {
        return current;
    }
    public void setCurrent(int[] current) {
        this.current = current;
    }
    public int[] getMaxCurrent() {
        return maxCurrent;
    }
    public void setMaxCurrent(int[] maxCurrent) {
        this.maxCurrent = maxCurrent;
    }
    public ArrayList<Integer>[] getRoomMaxCurrent() {
        return roomMaxCurrent;
    }
    public void setRoomMaxCurrent(ArrayList<Integer>[] roomMaxCurrent) {
        this.roomMaxCurrent = roomMaxCurrent;
    }
    
    public static Summary getSummary(long userId){
        Summary summary = new Summary(userId);
        return summary;
    }
}
