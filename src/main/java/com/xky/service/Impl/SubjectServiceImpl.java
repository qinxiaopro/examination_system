package com.xky.service.Impl;

import com.xky.dao.SubjectDao;
import com.xky.domain.Subject;
import com.xky.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {
    @Autowired
    SubjectDao subjectDao;

    @Override
    public List<Subject> selectAllSubject() {
        return subjectDao.selectAllSubject();
    }

    @Override
    public Subject selectSubjectById(Integer id) {
        return subjectDao.selectSubjectById(id);
    }
}
