package com.xky.domain;

import java.sql.Date;
import java.sql.Time;

public class Examination {
    private Integer examinationId;
    private Integer subjectId;
    private Subject Subject;
    private Date date;

    @Override
    public String toString() {
        return "Examination{" +
                "examinationId=" + examinationId +
                ", subjectId=" + subjectId +
                ", Subject=" + Subject +
                ", date=" + date +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }

    public Integer getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(Integer examinationId) {
        this.examinationId = examinationId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public com.xky.domain.Subject getSubject() {
        return Subject;
    }

    public void setSubject(com.xky.domain.Subject subject) {
        Subject = subject;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    private Time startTime;
    private Time endTime;
}
