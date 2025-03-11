/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class Feedback {

    int feedbackId;

    int passsagerid;
    String feedbackText;
    int rating;
    String feedbackDate;
    String username;
    int employid;
    String phanhoinv;
    String datefeddback;
    int traloi;

    public Feedback() {
    }

    public Feedback(String phanhoinv, String datefeddback) {
        this.phanhoinv = phanhoinv;
        this.datefeddback = datefeddback;
    }

    public Feedback(int feedbackId, int passsagerid, String feedbackText, int rating, String feedbackDate, String username, int employid, String phanhoinv, String datefeddback, int traloi) {
        this.feedbackId = feedbackId;
        this.passsagerid = passsagerid;
        this.feedbackText = feedbackText;
        this.rating = rating;
        this.feedbackDate = feedbackDate;
        this.username = username;
        this.employid = employid;
        this.phanhoinv = phanhoinv;
        this.datefeddback = datefeddback;
        this.traloi = traloi;
    }

    public int getEmployid() {
        return employid;
    }

    public void setEmployid(int employid) {
        this.employid = employid;
    }

    public String getPhanhoinv() {
        return phanhoinv;
    }

    public void setPhanhoinv(String phanhoinv) {
        this.phanhoinv = phanhoinv;
    }

    public String getDatefeddback() {
        return datefeddback;
    }

    public void setDatefeddback(String datefeddback) {
        this.datefeddback = datefeddback;
    }

    public int getTraloi() {
        return traloi;
    }

    public void setTraloi(int traloi) {
        this.traloi = traloi;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getPasssagerid() {
        return passsagerid;
    }

    public void setPasssagerid(int passsagerid) {
        this.passsagerid = passsagerid;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(String feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String checkResponseStatus() {
        if (traloi == 0) {
            return "Chưa phản hồi";
        } else if (traloi == 1) {
            return "Đã phản hồi";
        } else {
            return "Trạng thái không hợp lệ"; 
        }
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackId=" + feedbackId + ", passsagerid=" + passsagerid + ", feedbackText=" + feedbackText + ", rating=" + rating + ", feedbackDate=" + feedbackDate + ", username=" + username + '}';
    }

}
