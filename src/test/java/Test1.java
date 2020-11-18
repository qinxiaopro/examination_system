import com.xky.controller.TeacherController;
import com.xky.dao.TeacherDao;
import com.xky.domain.LayUIAdapter;
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


    @Test
    public void test() throws Exception{
        LayUIAdapter layUIAdapter = teacherController.selectAllTeacher(1,10);
        System.out.println(layUIAdapter.getData());

    }
}
