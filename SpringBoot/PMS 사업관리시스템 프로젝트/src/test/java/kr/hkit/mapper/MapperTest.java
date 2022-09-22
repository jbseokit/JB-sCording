package kr.hkit.mapper;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.hkit.pms.KitPms2Application;
import kr.hkit.pms.mapper.human.AttendanceMgtMapper;
import lombok.extern.log4j.Log4j2;

@ExtendWith(SpringExtension.class)
@Log4j2
@SpringBootTest(classes = KitPms2Application.class)
public class MapperTest {
	
	@Autowired
    AttendanceMgtMapper amm;

    @Test
    public void test1() {
        log.info(amm.getList());
    }
}
