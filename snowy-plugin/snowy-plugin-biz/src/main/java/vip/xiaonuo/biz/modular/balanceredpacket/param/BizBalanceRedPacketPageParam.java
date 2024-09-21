package vip.xiaonuo.biz.modular.balanceredpacket.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 红包记账查询参数
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Getter
@Setter
public class BizBalanceRedPacketPageParam {

    /** 当前页 */
    @ApiModelProperty(value = "当前页码")
    private Integer current;

    /** 每页条数 */
    @ApiModelProperty(value = "每页条数")
    private Integer size;

    /** 排序字段 */
    @ApiModelProperty(value = "排序字段，字段驼峰名称，如：userName")
    private String sortField;

    /** 排序方式 */
    @ApiModelProperty(value = "排序方式，升序：ASCEND；降序：DESCEND")
    private String sortOrder;

    /** 关键词 */
    @ApiModelProperty(value = "关键词")
    private String searchKey;

    /** 时间开始 */
    @ApiModelProperty(value = "时间开始")
    private String startAccountDate;

    /** 时间结束 */
    @ApiModelProperty(value = "时间结束")
    private String endAccountDate;

    /** 事由 */
    @ApiModelProperty(value = "事由")
    private String reason;

    /** 是否发红包 */
    @ApiModelProperty(value = "是否发红包")
    private String giveType;

    /** 对方名 */
    @ApiModelProperty(value = "对方名")
    private String person;

    /** 备注 */
    @ApiModelProperty(value = "备注")
    private String remark;

    /** 年份 */
    @ApiModelProperty(value = "年份")
    private Integer accountYear;

}
