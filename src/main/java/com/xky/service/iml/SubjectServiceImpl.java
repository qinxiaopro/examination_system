package com.xky.service.iml;

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
}
