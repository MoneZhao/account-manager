package com.monezhao.bean.utilsVo;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:40
 * @Description:
 */
@Data
public class ElTree implements Serializable {

    private static final long serialVersionUID = -3847234907769951488L;

    private String id;
    private String label;
    private String parentId;
    private Boolean disabled;
    private Boolean isLeaf;
    private Object data;
    private List<ElTree> children;

    public void addChildren(ElTree elTree) {
        if (children == null) {
            children = new ArrayList<ElTree>();
        }
        children.add(elTree);
    }

    public void addChildrens(List<ElTree> elTreeList) {
        if (children == null) {
            children = new ArrayList<ElTree>();
        }
        children.addAll(elTreeList);
    }
}
