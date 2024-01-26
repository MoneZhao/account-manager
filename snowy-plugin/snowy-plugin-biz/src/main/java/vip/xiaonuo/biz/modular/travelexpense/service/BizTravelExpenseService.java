package vip.xiaonuo.biz.modular.travelexpense.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseAddParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseEditParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseIdParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;

import java.util.List;

/**
 * 出差报销Service接口
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
public interface BizTravelExpenseService extends IService<BizTravelExpense> {

    /**
     * 获取出差报销分页
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     */
    Page<BizTravelExpense> page(BizTravelExpensePageParam bizTravelExpensePageParam);

    /**
     * 添加出差报销
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     */
    void add(BizTravelExpenseAddParam bizTravelExpenseAddParam);

    /**
     * 编辑出差报销
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     */
    void edit(BizTravelExpenseEditParam bizTravelExpenseEditParam);

    /**
     * 删除出差报销
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     */
    void delete(List<BizTravelExpenseIdParam> bizTravelExpenseIdParamList);

    /**
     * 获取出差报销详情
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     */
    BizTravelExpense detail(BizTravelExpenseIdParam bizTravelExpenseIdParam);

    /**
     * 获取出差报销详情
     *
     * @author monezhao
     * @date  2023/12/23 19:25
     **/
    BizTravelExpense queryEntity(String id);

    /**
     * 出差报销文件上传
     * @param file file
     */
    void importManager(MultipartFile file);

    /**
     * 导入出差报销
     *
     * @param list list
     * @return
     */
    void doImport(List<BizTravelExpense> list);
}
