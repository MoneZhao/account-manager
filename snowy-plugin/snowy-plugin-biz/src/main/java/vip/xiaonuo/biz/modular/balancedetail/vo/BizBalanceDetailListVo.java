package vip.xiaonuo.biz.modular.balancedetail.vo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;

/**
 * @author monezhao@163.com
 * @date 2024/1/16 12:08 PM
 */
public class BizBalanceDetailListVo extends BizBalanceDetail {
    /**
     * 表单内编辑
     */
    @TableField(exist = false)
    @ApiModelProperty(hidden = true)
    @ExcelIgnore
    private Boolean isEditPropertyShow = false;
}
