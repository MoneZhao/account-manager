package vip.xiaonuo.dev.core.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 字典实体
 *
 * @author xuyuxiang
 * @date 2022/2/23 18:27
 **/
@Getter
@Setter
public class DevDictApiPojo {

    /** id */
    @ApiModelProperty(value = "id", position = 1)
    private String id;

    /** 父id */
    @ApiModelProperty(value = "父id", position = 2)
    private String parentId;

    /** 字典文字 */
    @ApiModelProperty(value = "字典文字", position = 3)
    private String dictLabel;

    /** 字典值 */
    @ApiModelProperty(value = "字典值", position = 4)
    private String dictValue;

    /** 分类 */
    @ApiModelProperty(value = "分类", position = 5)
    private String category;

    /** 排序码 */
    @ApiModelProperty(value = "排序码", position = 6)
    private Integer sortCode;

}
