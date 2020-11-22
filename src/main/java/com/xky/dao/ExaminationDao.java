package com.xky.dao;

import com.xky.domain.Examination;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ExaminationDao {
    List<Examination> selectAllExamination();
}
