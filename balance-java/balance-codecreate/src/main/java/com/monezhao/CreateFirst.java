package com.monezhao;

import com.monezhao.first.CreateController;
import com.monezhao.first.CreateEntity;
import com.monezhao.first.CreateMybatisMapper;
import com.monezhao.first.CreateMybatisMapperXml;
import com.monezhao.first.CreateService;
import com.monezhao.first.CreateServiceImpl;
import com.monezhao.first.CreateSql;
import com.monezhao.first.CreateVue;
import com.monezhao.util.CodeUtil;

import java.io.File;
import java.util.Arrays;
import java.util.List;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:49
 * @Description:
 */
public class CreateFirst {
    public static void main(String[] args) {
        CodeUtil.databaseType = CreateSql.MYSQL;
        CodeUtil.module = "balance-balance";
        CodeUtil.excelDesignPath = CodeUtil.projectPath + "db" + File.separator + "数据库设计(balance_出差报销).xlsx";
        List<String> createTableNames = Arrays.asList(
                //"t_sys_pic_up_down",
                "t_sys_travel_expense"
        );
        for (String createTableName : createTableNames) {
            CodeUtil.createTableName = createTableName;
            // 创建建表语句
            CreateSql.create(CodeUtil.createTableName);
            // 创建对象实体类和数据库一一对应
            CreateEntity.create(CodeUtil.createTableName);
            // 创建mybatisMapper.xml文件
            CreateMybatisMapperXml.create(CodeUtil.createTableName, "first");
            // 创建mybatisMapper.java文件
            CreateMybatisMapper.create(CodeUtil.createTableName, "first");
            // 创建操作数据库的Service类
            CreateService.create(CodeUtil.createTableName, "first");
            // 创建操作数据库的ServiceImpl类
            CreateServiceImpl.create(CodeUtil.createTableName, "first");
            // 创建SpringMvc控制器的Controller类
            CreateController.create(CodeUtil.createTableName, "first");
            // 创建Vue前端文件
            CreateVue.create(CodeUtil.createTableName, "first");
        }
    }
}
