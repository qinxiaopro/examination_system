package com.xky.domain;

public class Subject {
    private Integer subjectId;
    private String name;
    private Integer available;

    public Subject() {
    }

    public Subject(Integer subjectId, String name, Integer available) {
        this.subjectId = subjectId;
        this.name = name;
        this.available = available;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }
}
