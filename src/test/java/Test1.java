import com.xky.controller.TeacherController;
import com.xky.dao.TeacherDao;
import com.xky.domain.LayUIAdapter;
import com.xky.domain.QuestionBank;
import com.xky.domain.Subject;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.util.List;

@SpringJUnitConfig
public class Test1 {

    @Autowired
    private TeacherController teacherController;

    @Autowired
    private TeacherDao teacherDao;


    @Test
    public void test() throws Exception {
        LayUIAdapter layUIAdapter = teacherController.selectAllTeacher(1, 10);
        System.out.println(layUIAdapter.getData());

    }

    @Test
    public void test2() throws Exception {
        QuestionBank questionBank = new QuestionBank();
        questionBank.setQuestion("黄埔军校最显著的办学特点是 （  ）");
        questionBank.setAnswers("学员从军事斗争实践中接受锻炼`共产党人负责政治工作 `把政治教育同军事训练放在同等重要的地位`为革命培养大批军事人才");
        questionBank.setTrueAnswer("学员从军事斗争实践中接受锻炼");
        questionBank.setType("single");
        questionBank.setSubjectId(2);
        questionBank.setTeacherId(7);
        questionBank.setAvailable(1);
        teacherDao.insertQuestionBank(questionBank);
    }

    @Test
    public void test3() throws Exception {
        List<Subject> subjects = teacherDao.selectAllSubject();
        System.out.println(subjects);
    }

    @Test
    public void test4() throws Exception {
        Teacher teacher = new Teacher();
        teacher.setTeacherId(7);
        List<QuestionBank> questionBanks = teacherDao.selectCurrentTeacherQuestionBank(teacher);
        System.out.println(questionBanks);
    }
}
