package vip.xiaonuo.biz.modular.balancecount.enums;

import lombok.Getter;

/**
 * 计入总资产枚举
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Getter
public enum BizBalanceCountEnum {

    /** 测试 */
    TEST("TEST");

    private final String value;

    BizBalanceCountEnum(String value) {
        this.value = value;
    }
}
