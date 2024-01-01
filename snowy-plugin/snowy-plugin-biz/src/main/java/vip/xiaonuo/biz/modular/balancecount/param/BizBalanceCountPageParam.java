package vip.xiaonuo.biz.modular.balancecount.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 计入总资产查询参数
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Getter
@Setter
public class BizBalanceCountPageParam {

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

    /** 账户类型ID */
    @ApiModelProperty(value = "账户类型ID")
    private String codeInfoId;

    /** 是否计入总资产 */
    @ApiModelProperty(value = "是否计入总资产")
    private String countType;

    @ApiModelProperty(value = "所属用户")
    private String userId;

}
