package com.xky.domain;

public class QuestionBank {
    private Integer questionBankId; // id
    private String question; // 题目
    private String answers;//答案
    private String trueAnswer;// 正确答案1
    private String type;//题类型（单选，多选...）
    private Integer subjectId;//科目
    private Integer teacherId;//所属教师
    private Integer available; //是否可用 0 不用，1可用


    public QuestionBank(Integer questionBankId, String question, String answers, String trueAnswer, String type, Integer subjectId, Integer teacherId, Integer available) {
        this.questionBankId = questionBankId;
        this.question = question;
        this.answers = answers;
        this.trueAnswer = trueAnswer;
        this.type = type;
        this.subjectId = subjectId;
        this.teacherId = teacherId;
        this.available = available;
    }


    public QuestionBank() {
    }


    public Integer getQuestionBankId() {
        return questionBankId;
    }

    public void setQuestionBankId(Integer questionBankId) {
        this.questionBankId = questionBankId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public String getTrueAnswer() {
        return trueAnswer;
    }

    public void setTrueAnswer(String trueAnswer) {
        this.trueAnswer = trueAnswer;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }
}
