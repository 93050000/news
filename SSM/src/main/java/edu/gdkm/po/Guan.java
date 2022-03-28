package edu.gdkm.po;
//管理员管理bean
public class Guan {
    private Integer guanId;
    private String  guanAccount;
    private String password;
    private String username;

    @Override
    public String toString() {
        return "Guan{" +
                "guanId=" + guanId +
                ", guanAccount='" + guanAccount + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                '}';
    }

    public Integer getGuanId() {
        return guanId;
    }

    public void setGuanId(Integer guanId) {
        this.guanId = guanId;
    }

    public String getGuanAccount() {
        return guanAccount;
    }

    public void setGuanAccount(String guanAccount) {
        this.guanAccount = guanAccount;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Guan() {
    }

    public Guan(Integer guanId, String guanAccount, String password, String username) {
        this.guanId = guanId;
        this.guanAccount = guanAccount;
        this.password = password;
        this.username = username;
    }
}
