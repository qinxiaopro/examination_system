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
//    private TeacherDao teacherDao;

    @Test
    public void test() throws Exception{
//        String layUIAdapter = selectAllTeacher.selectAllTeacher();
//        System.out.println(layUIAdapter);
        LayUIAdapter layUIAdapter = teacherController.selectAllTeacher();
        System.out.println(layUIAdapter.getData());


    }
}
