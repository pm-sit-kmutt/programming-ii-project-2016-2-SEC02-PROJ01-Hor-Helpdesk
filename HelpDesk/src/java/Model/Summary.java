package Model;

import java.util.ArrayList;

public class Summary extends ProblemName{
    private long userId;
    private int[] past;
    private int[] maxPast;
    private int[] roomMaxPast;
    private int[] now;
    private int[] maxNow;
    private int[] roomMaxNow;
    private ArrayList<Problem> list;

    public Summary(long userId) {
        this.userId = userId;
        past = new int[27];
        for (int i = 0; i < past.length; i++) {
            past[i] = 0;
        }
        maxPast = past;
        roomMaxPast = past;
        now = past;
        maxNow = past;
        roomMaxNow = past;
        list = new ListProblem(userId).getList();
        for (int i = 0; i < list.size(); i++) {
            past[(list.get(i).getProblemId())-1] += list.get(i).getProblemP();
            if(past[(list.get(i).getProblemId())-1] < list.get(i).getProblemP()) {
                maxPast[((list.get(i).getProblemId())-1)] = list.get(i).getProblemP();
                roomMaxPast[((list.get(i).getProblemId())-1)] = list.get(i).getRoom();
            }
            now[(list.get(i).getProblemId())-1] += list.get(i).getProblemN();
            if(now[(list.get(i).getProblemId())-1] < list.get(i).getProblemN()) {
                maxNow[((list.get(i).getProblemId())-1)] = list.get(i).getProblemN();
                roomMaxNow[((list.get(i).getProblemId())-1)] = list.get(i).getRoom();
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
    public int[] getRoomMaxPast() {
        return roomMaxPast;
    }
    public void setRoomMaxPast(int[] roomMaxPast) {
        this.roomMaxPast = roomMaxPast;
    }
    public int[] getNow() {
        return now;
    }
    public void setNow(int[] now) {
        this.now = now;
    }
    public int[] getMaxNow() {
        return maxNow;
    }
    public void setMaxNow(int[] maxNow) {
        this.maxNow = maxNow;
    }
    public int[] getRoomMaxNow() {
        return roomMaxNow;
    }
    public void setRoomMaxNow(int[] roomMaxNow) {
        this.roomMaxNow = roomMaxNow;
    }
    
    public static Summary getSummary(long userId){
        Summary summary = new Summary(userId);
        return summary;
    }
}
