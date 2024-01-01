package vip.xiaonuo.biz.modular.balancemain.enums;

import lombok.Getter;

/**
 * 账户余额枚举
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
public enum BizBalanceMainEnum {

    /** 测试 */
    TEST("TEST");

    private final String value;

    BizBalanceMainEnum(String value) {
        this.value = value;
    }
}
