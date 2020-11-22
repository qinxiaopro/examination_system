package com.xky.service;

import com.xky.domain.Subject;

import java.util.List;

public interface SubjectService {
    List<Subject> selectAllSubject();
    Subject selectSubjectById(Integer id);
}
