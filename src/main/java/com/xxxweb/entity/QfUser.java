package com.xxxweb.entity;

public class QfUser {
    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "QfUser{" +
                "id=" + id +
                ", username='" + username + '\'' +

                ", name='" + name + '\'' +
                ", edu='" + edu + '\'' +
                ", sex=" + sex +
                ", professional='" + professional + '\'' +
                ", age=" + age +
                ", marriage=" + marriage +
                ", tel='" + tel + '\'' +
                ", cardid='" + cardid + '\'' +
                ", position_id=" + position_id +
                ", job='" + job + '\'' +
                ", intime='" + intime + '\'' +
                ", state=" + state +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }


    public int getMarriage() {
        return marriage;
    }

    public void setMarriage(int marriage) {
        this.marriage = marriage;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getIntime() {
        return intime;
    }

    public void setIntime(String intime) {
        this.intime = intime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    private int id;
    private String username;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String password;

    private String name;
    private String edu;
    private int sex;
    private String professional;

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    private String age;
    private int marriage;
    private String tel;
    private String cardid;
    private int position_id;
    private String job;
    private String intime;
    private int state;

}
