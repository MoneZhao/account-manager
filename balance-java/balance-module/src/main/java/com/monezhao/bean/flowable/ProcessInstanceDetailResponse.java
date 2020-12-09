package com.monezhao.bean.flowable;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class ProcessInstanceDetailResponse extends HistoricProcessInstanceResponse {
    private boolean suspended;
    private String deleteReason;
    private String startUserName;

}
