package com.xky.service;

import com.xky.domain.Examination;

import java.util.List;

public interface ExaminationService {
    List<Examination> selectAllExamination();
    List<Examination> selectAllExamination_list();
}
