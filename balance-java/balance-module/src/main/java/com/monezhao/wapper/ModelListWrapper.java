package com.monezhao.wapper;

import com.monezhao.common.ResponseFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ModelListWrapper implements IListWrapper {

    @Autowired
    private ResponseFactory responseFactory;

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public List execute(List list) {
        return responseFactory.createModelResponseList(list);
    }
}