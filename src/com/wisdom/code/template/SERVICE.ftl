package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.util.List;

import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO;

import com.paic.pafa.app.biz.service.BusinessServiceException;

/**
 * @author HUANGZHIHUI300
 * 日期：${today?string("yyyy-MM-dd HH:mm:ss")}
 * 用途：数据库表${tableInfo.tableOriginalName}对应的service
 */
public interface ${tableInfo.tableName?cap_first}Service {

    /**
     * 批量查询表${tableInfo.tableOriginalName}的记录
     */
    public List<${tableInfo.tableName?cap_first}TO> get${tableInfo.tableName?cap_first}List(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException;

    /**
     * 新增表${tableInfo.tableOriginalName}的记录
     */
    public void insert${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException;
    
    
    /**
     * 删除表${tableInfo.tableOriginalName}的记录
     */
    public void delete${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException;

    /**
     * 查询表${tableInfo.tableOriginalName}的记录
     */
    public ${tableInfo.tableName?cap_first}TO get${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException;
}
