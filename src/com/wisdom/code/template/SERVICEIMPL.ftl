package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.paic.icore.fa.logging.Log;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.service}.${tableInfo.tableName?cap_first}Service;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dao}.${tableInfo.tableName?cap_first}DAO;
import com.paic.pafa.app.biz.service.BusinessServiceException;

/**
 * @author HUANGZHIHUI300
 * 日期：${today?string("yyyy-MM-dd HH:mm:ss")}
 * 用途：数据库表${tableInfo.tableOriginalName}对应的serviceImpl
 */
 
@Component("${tableInfo.tableName?uncap_first}Service")
public class ${tableInfo.tableName?cap_first}ServiceImpl implements ${tableInfo.tableName?cap_first}Service {
    
    @Autowired
    private Log log;

    @Autowired
    private ${tableInfo.tableName?cap_first}DAO ${tableInfo.tableName?uncap_first}DAO;
    
    /**
     * 批量查询表${tableInfo.tableOriginalName}的记录
     */
    public List<${tableInfo.tableName?cap_first}TO> get${tableInfo.tableName?cap_first}List(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException {
        try {
            return ${tableInfo.tableName?uncap_first}DAO.get${tableInfo.tableName?cap_first}List(${tableInfo.tableName?uncap_first}TO);
        } catch (Exception e) {
            this.log.error(e);
            throw new BusinessServiceException(e);
        }
    }

    /**
     * 新增表${tableInfo.tableOriginalName}的记录
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException {
        try {
            ${tableInfo.tableName?uncap_first}DAO.insert${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO);
        } catch (Exception e) {
            this.log.error(e);
            throw new BusinessServiceException(e);
        }
    }
    
    
    /**
     * 删除表${tableInfo.tableOriginalName}的记录
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException {
        try {
            ${tableInfo.tableName?uncap_first}DAO.delete${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO);
        } catch (Exception e) {
            this.log.error(e);
            throw new BusinessServiceException(e);
        }
    }

    /**
     * 查询表${tableInfo.tableOriginalName}的记录
     */
    public ${tableInfo.tableName?cap_first}TO get${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) throws BusinessServiceException {
        try {
            return ${tableInfo.tableName?uncap_first}DAO.get${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO);
        } catch (Exception e) {
            this.log.error(e);
            throw new BusinessServiceException(e);
        }
    }
    
    public ${tableInfo.tableName?cap_first}DAO get${tableInfo.tableName?cap_first}DAO() {
        return ${tableInfo.tableName?uncap_first}DAO;
    }

    public void set${tableInfo.tableName?cap_first}DAO(${tableInfo.tableName?cap_first}DAO ${tableInfo.tableName?uncap_first}DAO) {
        this.${tableInfo.tableName?uncap_first}DAO = ${tableInfo.tableName?uncap_first}DAO;
    }

    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }
}
