package com.monezhao.controller.command;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/7/7 5:23 下午
 */
@Getter
@Setter
public class UserShortCut {

    private String userId;

    private List<String> add;

    private List<String> del;

}
