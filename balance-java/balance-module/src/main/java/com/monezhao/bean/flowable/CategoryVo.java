package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.List;

@Data
public class CategoryVo {
    private String category;
    private String categoryName;
    private List<ProcessDefinitionVo> processDefinitionVoList;
}
