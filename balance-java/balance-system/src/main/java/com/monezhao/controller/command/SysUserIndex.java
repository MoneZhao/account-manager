package com.monezhao.controller.command;

import com.monezhao.bean.utilsVo.ShortCut;
import lombok.Data;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/6/8 3:11 下午
 */
@Data
public class SysUserIndex {

    private Long totalVisitCount;

    private Long todayVisitCount;

    private Long todayIp;

    private List<VisitCount> lastSevenVisitCount;

    private List<VisitCount> lastSevenUserVisitCount;

    private List<ShortCut> menuList;
}
