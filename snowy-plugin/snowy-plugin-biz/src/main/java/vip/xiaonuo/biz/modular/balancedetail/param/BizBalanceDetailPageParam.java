package vip.xiaonuo.biz.modular.balancedetail.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 账户明细查询参数
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
@Setter
public class BizBalanceDetailPageParam {

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

    /** 账户类型 */
    @ApiModelProperty(value = "账户类型")
    private String balanceType;

    /** 主表ID */
    @ApiModelProperty(value = "主表ID")
    private String balanceMainId;

    /** 所属用户 */
    @ApiModelProperty(value = "所属用户")
    private String userId;

}
