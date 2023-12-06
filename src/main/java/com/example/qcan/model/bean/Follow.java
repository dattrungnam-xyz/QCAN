package com.example.qcan.model.bean;

public class Follow {
    private int IdFl;
    private int IdFler;
    private int IdFLed;
    private boolean Fled;

    public void setFled(boolean fled) {
        Fled = fled;
    }

    public boolean isFled() {
        return Fled;
    }

    public int getIdFl() {
        return IdFl;
    }

    public int getIdFLed() {
        return IdFLed;
    }

    public int getIdFler() {
        return IdFler;
    }

    public void setIdFl(int idFl) {
        IdFl = idFl;
    }

    public void setIdFLed(int idFLed) {
        IdFLed = idFLed;
    }

    public void setIdFler(int idFler) {
        IdFler = idFler;
    }
}
