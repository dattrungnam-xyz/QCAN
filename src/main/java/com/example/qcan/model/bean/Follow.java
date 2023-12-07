package com.example.qcan.model.bean;

public class Follow {
    private int IdFl;
    private int IdFler;
    private int IdFled;
    private boolean Fled;
    private int countFollow;
    private int countFollower;

    public int getCountFollower() {
        return countFollower;
    }

    public void setCountFollower(int countFollower) {
        this.countFollower = countFollower;
    }


    public int getCountFollow() {
        return countFollow;
    }

    public void setCountFollow(int countFollow) {
        this.countFollow = countFollow;
    }

    public void setFled(boolean fled) {
        Fled = fled;
    }

    public boolean isFled() {
        return Fled;
    }

    public int getIdFl() {
        return IdFl;
    }

    public int getIdFled() {
        return IdFled;
    }

    public int getIdFler() {
        return IdFler;
    }

    public void setIdFl(int idFl) {
        IdFl = idFl;
    }

    public void setIdFled(int idFLed) {
        IdFled = idFLed;
    }

    public void setIdFler(int idFler) {
        IdFler = idFler;
    }
}
