package vip.xiaonuo.dev.api;

import vip.xiaonuo.dev.core.pojo.DevDictApiPojo;

import java.util.List;

/**
 * 字典API
 *
 * @author xuyuxiang
 * @date 2022/9/2 15:58
 */
public interface DevDictApi {

    String getIdByDictValue(String dictValue);

    List<DevDictApiPojo> getListByParentId(String parentId);

}
