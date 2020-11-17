import com.xky.controller.TeacherController;
import com.xky.dao.TeacherDao;
import com.xky.domain.LayUIAdapter;
import com.xky.domain.Teacher;
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
    public void test() throws Exception{
        LayUIAdapter layUIAdapter = teacherController.selectAllTeacher();
        System.out.println(layUIAdapter.getData());


    }

//    @Test
//    public void test2() throws Exception{
//        for (int i = 0; i < 400; i++) {
//            teacherDao.insertTeacher(new Teacher(null,"test+"+i+"","男",i,"234234"+i+"","广西桂林"+i,"img/"+i));
//        }
//    }

}
