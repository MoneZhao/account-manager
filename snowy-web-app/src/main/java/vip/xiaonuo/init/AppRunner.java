package vip.xiaonuo.init;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.system.ApplicationPid;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 系统初始化之后的方法
 *
 * @author monezhao@163.com
 * @date 2023-07-15 下午 04:36
 */
@Component
@Slf4j
public class AppRunner implements ApplicationRunner {
    @Autowired
    private TomcatServletWebServerFactory tomcatServletWebServerFactory;

    @Override
    public void run(ApplicationArguments args) {
        try {
            String host = InetAddress.getLocalHost().getHostAddress();
            int port = tomcatServletWebServerFactory.getPort();
            String contextPath = tomcatServletWebServerFactory.getContextPath();
            log.info("---------启动成功, 进程号 {}, 访问路径: ", new ApplicationPid());
            log.info("-----------Local: http://" + "127.0.0.1:" + port + contextPath + "/");
            log.info("-----------Network: http://" + host + ":" + port + contextPath + "/");
        } catch (UnknownHostException | NoSuchBeanDefinitionException ignored) {
        }
    }
}
