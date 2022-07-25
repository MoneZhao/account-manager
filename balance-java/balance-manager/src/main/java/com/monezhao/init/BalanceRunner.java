package com.monezhao.init;

import com.monezhao.config.DefaultSystemConfig;
import com.monezhao.service.SysCodeInfoService;
import com.monezhao.service.SysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:12
 * @Description: 系统初始化
 */
@Component
@Slf4j
public class BalanceRunner implements ApplicationRunner {

    @Autowired
    private TomcatServletWebServerFactory tomcatServletWebServerFactory;
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private SysCodeInfoService sysCodeInfoService;

    @Autowired
    private DefaultSystemConfig defaultSystemConfig;

    @Override
    public void run(ApplicationArguments args) {
        sysConfigService.loadSysConfigToRedis(null);
        sysCodeInfoService.loadSysCodeInfoToRedis(null);

        log.info("------【加载数据字典数据】---------");
        try {
            String host = InetAddress.getLocalHost().getHostAddress();
            int port = tomcatServletWebServerFactory.getPort();
            String contextPath = tomcatServletWebServerFactory.getContextPath();
            log.info(defaultSystemConfig.toString());
            log.info("---------启动成功,访问: ");
            log.info("-----------Local: http://" + "127.0.0.1:" + port + contextPath + "/");
            log.info("-----------Network: http://" + host + ":" + port + contextPath + "/");
        } catch (UnknownHostException | NoSuchBeanDefinitionException ignored) {
        }
    }
}
