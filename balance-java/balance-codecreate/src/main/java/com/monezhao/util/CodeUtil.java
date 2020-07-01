package com.monezhao.util;

import com.monezhao.common.Constants;
import com.monezhao.common.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:49
 * @Description:
 */
public class CodeUtil {
    private final static String DATA_TYPE_STRING = "字符型,整数型,浮点型,日期型,时间型,大文本,大文件";
    private final static String IS_NULL_STRING = "UUID主键,数据库生成主键,前台输入主键,不空,可空";
    private final static String YES_NO_STRING = "是,否";
    private final static String YES = "是";
    /**
     * 是否打印插入菜单sql
     */
    public static boolean isPrintInsertMenuSql = true;
    /**
     * 开发人员姓名
     */
    public static String author = "monezhao@163.com";
    /**
     * 数据库类型：oracle,mysql
     */
    public static String databaseType = "mysql";
    /**
     * 开发工程所在系统绝对路径
     */
    public static String projectPath = System.getProperty("user.dir") + File.separator;
    /**
     * 开发模块
     */
    public static String module = "balance-codecreate";
    /**
     * 自动生成的建表语句的输出路径
     */
    public static String createSqlPath = projectPath + "db" + File.separator + "tables" + File.separator;
    /**
     * excel名
     */
    public static String excelDesignPath = projectPath + "db" + File.separator + "数据库设计(sys_代码在线生成).xlsx";
    /**
     * 表
     */
    public static String createTableName = "t_sys_code_create";

    /**
     * 返回驼峰命名法结果.
     *
     * @param name 如:CODE_TYPE;Menu
     * @return 如: codeType, menu
     */
    public static String getTuoFengName(String name, boolean firstUpper) {
        StringBuilder stringBuffer = new StringBuilder();

        char[] nameArray = name.toLowerCase().toCharArray();
        // 下一个字母要大写
        boolean nextNeedUpper = false;
        for (int i = 0; i < nameArray.length; i++) {
            String tmp = String.valueOf(nameArray[i]);

            // 如果第一个字母大写
            if (firstUpper && i == 0) {
                stringBuffer.append(tmp.toUpperCase());
            } else {
                if ("_".equals(tmp)) {
                    nextNeedUpper = true;
                    continue;
                }

                // 下一个字母要大写
                if (nextNeedUpper) {
                    stringBuffer.append(tmp.toUpperCase());
                    nextNeedUpper = false;
                } else {
                    stringBuffer.append(tmp);
                }
            }
        }

        return stringBuffer.toString();
    }

    /**
     * @return 返回MAP, 英文表名为key值.value是表的字段对象list
     */
    public static LinkedHashMap<String, ArrayList<TableObject>> readExcelDesignInfo(String theTableName) {
        LinkedHashMap<String, ArrayList<TableObject>> hashMap = new LinkedHashMap<>();
        File file = new File(CodeUtil.excelDesignPath);
        Workbook workbook;
        try {
            workbook = WorkbookFactory.create(file);
            Sheet sheet = workbook.getSheetAt(1);
            String tableName = "", tableNameCn = "";
            ArrayList<TableObject> list = new ArrayList<>();
            for (int i = 0; i < sheet.getLastRowNum(); i++) {
                // 第4列内容
                String cellValue4 = CodeUtil.getStringRowCellValue(sheet.getRow(i), 3);
                if (StringUtils.isEmpty(cellValue4)) {
                    if (list.size() > 1) {
                        // 将表结构put
                        hashMap.put(tableName, list);
                    }
                    break;
                } else if ("字段英文名".equals(cellValue4)) {
                    if (list.size() > 1) {
                        // 将表结构put
                        hashMap.put(tableName, list);
                        list = new ArrayList<>();
                    }
                } else {
                    // 第一列的表名
                    // 第1列内容
                    String cellValue1 = CodeUtil.getStringRowCellValue(sheet.getRow(i), 0);
                    if (StringUtils.isNotEmpty(cellValue1)) {
                        if (cellValue1.startsWith("t_")) {
                            tableName = cellValue1;
                            tableNameCn = CodeUtil.getStringRowCellValue(sheet.getRow(i + 1), 0);
                        }
                    }
                    TableObject tableObject = resolveTableObject(sheet, tableName, tableNameCn, i);
                    list.add(tableObject);
                    // 到了最后一行,put数据
                    if (i == sheet.getLastRowNum() - 1) {
                        // 将表结构put
                        hashMap.put(tableName, list);
                        list = new ArrayList<>();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (StringUtils.isNotEmpty(theTableName)) {
            LinkedHashMap<String, ArrayList<TableObject>> hm = new LinkedHashMap<>();
            hm.put(theTableName, hashMap.get(theTableName));
            return hm;
        }
        return hashMap;
    }

    private static TableObject resolveTableObject(Sheet sheet, String tableName, String tableNameCn, int i)
            throws Exception {
        // 组织TableObject对象.
        TableObject tableObject = new TableObject();
        tableObject.setTableName(tableName);
        tableObject.setTableNameCn(tableNameCn);
        tableObject.setSortNo(CodeUtil.getStringRowCellValue(sheet.getRow(i), 1));
        tableObject.setColumnNameEn(CodeUtil.getStringRowCellValue(sheet.getRow(i), 3));
        tableObject.setColumnNameCn(CodeUtil.getStringRowCellValue(sheet.getRow(i), 2));
        // 数据类型
        String dataType = CodeUtil.getStringRowCellValue(sheet.getRow(i), 4);
        if (CommonUtil.isExist(DATA_TYPE_STRING, dataType, Constants.COMMA)) {
            tableObject.setDataType(dataType);
        } else {
            throw new Exception("excel设计中,第" + (i + 1) + "行【数据类型】取值错误!");
        }
        tableObject.setDataLength(CodeUtil.getStringRowCellValue(sheet.getRow(i), 5));
        tableObject.setDataPrecision(CodeUtil.getStringRowCellValue(sheet.getRow(i), 6));
        // 是否可空
        String isNull = CodeUtil.getStringRowCellValue(sheet.getRow(i), 7);
        if (CommonUtil.isExist(IS_NULL_STRING, isNull, Constants.COMMA)) {
            tableObject.setIsNull(isNull);
        } else {
            throw new Exception("excel设计中,第" + (i + 1) + "行【是否可空】取值错误!");
        }
        // 是否列表
        String isList = CodeUtil.getStringRowCellValue(sheet.getRow(i), 8);
        if (!CommonUtil.isEmptyStr(isList)) {
            if (CommonUtil.isExist(YES_NO_STRING, isList, Constants.COMMA)) {
                tableObject.setIsList(YES.equals(isList));
            } else {
                throw new Exception("excel设计中,第" + (i + 1) + "行【是否列表】取值错误!");
            }
        }
        // 是否查询条件
        String doSearch = CodeUtil.getStringRowCellValue(sheet.getRow(i), 9);
        if (!CommonUtil.isEmptyStr(doSearch)) {
            if (CommonUtil.isExist(YES_NO_STRING, doSearch, Constants.COMMA)) {
                tableObject.setIsSearch(YES.equals(doSearch));
            } else {
                throw new Exception("excel设计中,第" + (i + 1) + "行【是否查询】取值错误!");
            }
        }
        tableObject.setCodeTypeId(CodeUtil.getStringRowCellValue(sheet.getRow(i), 10));
        // 详细说明
        tableObject.setRemark(CodeUtil.getStringRowCellValue(sheet.getRow(i), 11));
        return tableObject;
    }

    /**
     * 读取excel的时候,取得String型的值.
     *
     * @param row       excel行对象
     * @param cellIndex 从0开始算
     * @return String
     */
    public static String getStringRowCellValue(Row row, int cellIndex) {
        String result = "";
        try {
            if (row != null) {
                Cell cell = row.getCell(cellIndex);
                if (cell != null) {
                    switch (cell.getCellType()) {
                        case STRING:
                            result = StringUtils.trimToEmpty(cell.getStringCellValue());
                            break;
                        case NUMERIC:
                            // 把数字型转换成 字符串
                            cell.setCellType(CellType.STRING);
                            result = StringUtils.trimToEmpty(cell.getStringCellValue());
                            break;
                        case BOOLEAN:
                            result = String.valueOf(cell.getBooleanCellValue());
                            break;
                        case BLANK:
                            result = "";
                            break;
                        default:
                            result = "";
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
