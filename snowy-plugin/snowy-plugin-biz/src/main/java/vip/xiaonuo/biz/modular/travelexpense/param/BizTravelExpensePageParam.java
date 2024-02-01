package vip.xiaonuo.biz.modular.travelexpense.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 出差报销查询参数
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
@Getter
@Setter
public class BizTravelExpensePageParam {

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

    /** 出差地点 */
    @ApiModelProperty(value = "出差地点")
    private String travelPlace;

    /** 所属用户 */
    @ApiModelProperty(value = "所属用户")
    private String userId;

    /** 所属组织 */
    @ApiModelProperty(value = "所属组织")
    private List<String> orgIds;

}
