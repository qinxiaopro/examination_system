package com.xky.service.Impl;

import com.xky.dao.ExaminationDao;
import com.xky.dao.SubjectDao;
import com.xky.domain.Examination;
import com.xky.domain.Subject;
import com.xky.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class ExaminationServiceImpl implements ExaminationService {
    @Autowired
    private ExaminationDao examinationDao;
    @Autowired
    private SubjectDao subjectDao;
    @Override
    public List<Examination> selectAllExamination() {
        return examinationDao.selectAllExamination();
    }

    @Override
    public List<Examination> selectAllExamination_list() {
        /**
         * 获取试题表列表数据
         */
        List<Examination> list = examinationDao.selectAllExamination();
        int size = list.size();
        List<Examination> list2 = new ArrayList<>();
        for(int i = 0;i<size;i++){
            Examination data = list.get(i);
            Subject subject =subjectDao.selectSubjectById(data.getSubjectId());
            data.setSubject(subject);
            data.setSubjectName(subject.getName());
            list2.add(i,data);
        }
        return list2;
    }
}
