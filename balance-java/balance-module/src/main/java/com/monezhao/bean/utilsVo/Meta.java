package com.monezhao.bean.utilsVo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Data
public class Meta implements Serializable {

    private static final long serialVersionUID = -7376483376636629408L;

    private String title;
    private String icon;
    private Boolean isCache = true;
    private Boolean affix;
}
