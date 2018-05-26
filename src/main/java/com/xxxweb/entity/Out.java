package com.xxxweb.entity;

public class Out {
    public int weight;

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Out{" +
                "id=" + id +
                ", bfr='" + bfr + '\'' +
                ", btel='" + btel + '\'' +
                ", wtime='" + wtime + '\'' +
                ", wrea='" + wrea + '\'' +
                ", uid=" + uid +
                ", jlqz='" + jlqz + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBfr() {
        return bfr;
    }

    public void setBfr(String bfr) {
        this.bfr = bfr;
    }

    public String getBtel() {
        return btel;
    }

    public void setBtel(String btel) {
        this.btel = btel;
    }

    public String getWtime() {
        return wtime;
    }

    public void setWtime(String wtime) {
        this.wtime = wtime;
    }

    public String getWrea() {
        return wrea;
    }

    public void setWrea(String wrea) {
        this.wrea = wrea;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getJlqz() {
        return jlqz;
    }

    public void setJlqz(String jlqz) {
        this.jlqz = jlqz;
    }

    private int id;

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    private String addr;
    private String bfr;
    private String btel;
    private String wtime;
    private String wrea;
    private int uid;
    private String jlqz;

    private String ftime = "";
    private int state = 0;

    public String getComtime() {
        return comtime;
    }

    public void setComtime(String comtime) {
        this.comtime = comtime;
    }

    private String comtime;

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
