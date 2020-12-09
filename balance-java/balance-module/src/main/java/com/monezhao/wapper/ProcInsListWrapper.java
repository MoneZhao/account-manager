package com.monezhao.wapper;

import com.monezhao.common.ResponseFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020年3月22日
 */
@Component
public class ProcInsListWrapper implements IListWrapper {

    @Autowired
    private ResponseFactory responseFactory;

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public List execute(List list) {
        return responseFactory.createHistoricProcessInstanceResponseList(list);
    }
}
