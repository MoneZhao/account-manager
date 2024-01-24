package vip.xiaonuo.dev.modular.dict.provider;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.xiaonuo.dev.api.DevDictApi;
import vip.xiaonuo.dev.core.pojo.DevDictApiPojo;
import vip.xiaonuo.dev.modular.dict.entity.DevDict;
import vip.xiaonuo.dev.modular.dict.service.DevDictService;

import java.util.List;

/**
 * 字典API接口实现类
 *
 * @author xuyuxiang
 * @date 2022/9/2 16:05
 */
@Service
public class DevDictApiProvider implements DevDictApi {

    @Autowired
    private DevDictService devDictService;

    @Override
    public String getIdByDictValue(String dictValue) {
        QueryWrapper<DevDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(DevDict::getDictValue, dictValue);
        return devDictService.getOne(queryWrapper, false).getId();
    }

    @Override
    public List<DevDictApiPojo> getListByParentId(String parentId) {
        QueryWrapper<DevDict> queryWrapper = new QueryWrapper<>();
        // 查询部分字段
        queryWrapper.lambda().select(DevDict::getId, DevDict::getParentId, DevDict::getCategory, DevDict::getDictLabel,
                DevDict::getDictValue, DevDict::getSortCode);
        queryWrapper.lambda()
                .eq(DevDict::getParentId, parentId)
                .orderByAsc(DevDict::getParentId)
                .orderByAsc(DevDict::getSortCode);
        List<DevDict> devDicts = devDictService.list(queryWrapper);
        return BeanUtil.copyToList(devDicts, DevDictApiPojo.class);
    }
}
