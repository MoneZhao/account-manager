package com.monezhao.config;

import com.google.common.collect.Maps;
import com.monezhao.common.listener.TaskBeforeListener;
import lombok.SneakyThrows;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.common.engine.api.delegate.event.FlowableEventListener;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.awt.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Configuration
public class FlowableEngineConfig implements EngineConfigurationConfigurer<SpringProcessEngineConfiguration> {

    @Autowired
    private TaskBeforeListener taskBeforeListener;

    @SneakyThrows
    @Override
    public void configure(SpringProcessEngineConfiguration engineConfiguration) {
        Resource resource = new ClassPathResource("SourceHanSerifCN-Regular.ttf");
        Font font = Font.createFont(Font.TRUETYPE_FONT, resource.getInputStream());
        GraphicsEnvironment.getLocalGraphicsEnvironment().registerFont(font);
        engineConfiguration.setProcessDiagramGenerator(processDiagramGenerator());
        engineConfiguration.setActivityFontName(font.getFontName());
        engineConfiguration.setLabelFontName(font.getFontName());
        engineConfiguration.setAnnotationFontName(font.getFontName());
        engineConfiguration.setTypedEventListeners(customFlowableListeners());
    }

    @Bean
    public ProcessDiagramGenerator processDiagramGenerator() {
        return new CustomProcessDiagramGenerator();
    }

    private Map<String, List<FlowableEventListener>> customFlowableListeners() {
        Map<String, List<FlowableEventListener>> listenerMap = Maps.newHashMap();
        listenerMap.put(FlowableEngineEventType.TASK_CREATED.name(),
                new ArrayList<>(Collections.singletonList(taskBeforeListener)));
        return listenerMap;
    }
}
