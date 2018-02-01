package cn.anline.zone.serve.console.v1.bean;

/**
 * 带Token的用户信息Bean
 */
public class LoginBean {
    private Long id;
    private Long role_id;
    private String username;
    private String avatar;
    private String nickname;
    private String occupation;
    private String company;
    private String mobile;
    private String province;
    private String city;
    private String district;
    private String address;
    private String qq;
    private String wechat;
    private String github;
    private String weibo;
    private String email;
    private Long gender;
    private String profile;
    private Long status;

    public LoginBean(Long id, Long role_id, String username, String avatar, String nickname, String occupation, String company, String mobile, String province, String city, String district, String address, String qq, String wechat, String github, String weibo, String email, Long gender, String profile, Long status, Long create_time, Long update_time, String token) {
        this.id = id;
        this.role_id = role_id;
        this.username = username;
        this.avatar = avatar;
        this.nickname = nickname;
        this.occupation = occupation;
        this.company = company;
        this.mobile = mobile;
        this.province = province;
        this.city = city;
        this.district = district;
        this.address = address;
        this.qq = qq;
        this.wechat = wechat;
        this.github = github;
        this.weibo = weibo;
        this.email = email;
        this.gender = gender;
        this.profile = profile;
        this.status = status;
        this.create_time = create_time;
        this.update_time = update_time;
        this.token = token;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRole_id() {
        return role_id;
    }

    public void setRole_id(Long role_id) {
        this.role_id = role_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    public String getWeibo() {
        return weibo;
    }

    public void setWeibo(String weibo) {
        this.weibo = weibo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getGender() {
        return gender;
    }

    public void setGender(Long gender) {
        this.gender = gender;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Long create_time) {
        this.create_time = create_time;
    }

    public Long getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Long update_time) {
        this.update_time = update_time;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    private Long create_time;
    private Long update_time;
    private String token;
}
