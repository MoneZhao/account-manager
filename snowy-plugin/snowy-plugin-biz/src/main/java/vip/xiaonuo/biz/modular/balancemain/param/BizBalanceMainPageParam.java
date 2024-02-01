package vip.xiaonuo.biz.modular.balancemain.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * 账户余额查询参数
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
@Setter
public class BizBalanceMainPageParam {

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

    /** 所属用户 */
    @ApiModelProperty(value = "所属用户")
    private String userId;

    /** 所属组织 */
    @ApiModelProperty(value = "所属组织")
    private List<String> orgIds;

    /**
     * 当月是否多条数据
     */
    @ApiModelProperty(value = "结束时间")
    private String multiData;

    /** 记录时间 */
    @ApiModelProperty(value = "记录时间")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /** 记录时间开始 */
    @ApiModelProperty(value = "记录时间开始")
    private String startAccountDate;

    /** 记录时间结束 */
    @ApiModelProperty(value = "记录时间结束")
    private String endAccountDate;

    /** 删除标志 */
    @ApiModelProperty(value = "删除标志")
    private Date deleteFlag;

}
