package Model;

public class User {
    private long userId = 0;

    public User() {
    }
    public User(long userId){
        this.userId = userId;
    }

    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public String toString(){
        return ""+userId;
    }
}
