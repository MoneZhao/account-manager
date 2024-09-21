package vip.xiaonuo.biz.modular.balanceredpacket.enums;

import lombok.Getter;

/**
 * 红包记账枚举
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Getter
public enum BizBalanceRedPacketEnum {

    /** 测试 */
    TEST("TEST");

    private final String value;

    BizBalanceRedPacketEnum(String value) {
        this.value = value;
    }
}
