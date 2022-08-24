package net.newmember.vo;

import java.io.Serializable;

public class NewMemberVO implements Serializable {

    public String name;

    public String email;

    public String hopeField;

    public String age;

    public String career;

    public String purpose;

    public String gender;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHopeField() {
        return hopeField;
    }

    public void setHopeField(String hopeField) {
        this.hopeField = hopeField;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
