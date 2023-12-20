package vip.xiaonuo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

/**
 * SpringBoot方式启动类
 *
 * @author xuyuxiang
 * @date 2021/12/18 16:57
 */
@Slf4j
@EnableSwagger2WebMvc
@RestController
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
