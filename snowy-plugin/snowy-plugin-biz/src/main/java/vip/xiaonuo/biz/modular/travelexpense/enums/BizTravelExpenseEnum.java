package vip.xiaonuo.biz.modular.travelexpense.enums;

import lombok.Getter;

/**
 * 出差报销枚举
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
@Getter
public enum BizTravelExpenseEnum {

    /** 测试 */
    TEST("TEST");

    private final String value;

    BizTravelExpenseEnum(String value) {
        this.value = value;
    }
}
