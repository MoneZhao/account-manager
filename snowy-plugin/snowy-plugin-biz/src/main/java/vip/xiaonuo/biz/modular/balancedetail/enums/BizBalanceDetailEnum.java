package vip.xiaonuo.biz.modular.balancedetail.enums;

import lombok.Getter;

/**
 * 账户明细枚举
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
public enum BizBalanceDetailEnum {

    /** 测试 */
    TEST("TEST");

    private final String value;

    BizBalanceDetailEnum(String value) {
        this.value = value;
    }
}
