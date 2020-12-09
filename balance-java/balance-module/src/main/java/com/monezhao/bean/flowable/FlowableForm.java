package com.monezhao.bean.flowable;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @date 2020年3月23日
 */
@Data
@TableName("t_flowable_form")
public class FlowableForm extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId
    @NotNull
    @LengthForUtf8(max = 100)
    private String formKey;

    @NotNull
    @LengthForUtf8(max = 100)
    private String formName;

    private String formJson;
}