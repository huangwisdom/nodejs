package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.paic.icore.fa.logging.Log;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dao}.${tableInfo.tableName?cap_first}DAO;
import com.paic.pafa.biz.dao.BaseDAO;

/**
 * @author HUANGZHIHUI300
 * 日期：${today?string("yyyy-MM-dd HH:mm:ss")}
 * 用途：数据库表${tableInfo.tableOriginalName}对应的DAO实现类
 */
@SuppressWarnings({"unchecked", "unused"})
@Component("${tableInfo.tableName?uncap_first}DAO")
public class ${tableInfo.tableName?cap_first}IbatisDAO extends BaseDAO implements ${tableInfo.tableName?cap_first}DAO {

    @Autowired
    private Log log;

    @Override
    public void setBeanName(String beanName) {
    }

    /**
     * 批量查询表${tableInfo.tableOriginalName}的记录
     */
    @Override
    public List<${tableInfo.tableName?cap_first}TO> get${tableInfo.tableName?cap_first}List(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) {
        return (List<${tableInfo.tableName?cap_first}TO>) super._list("get${tableInfo.tableName?cap_first}List", ${tableInfo.tableName?uncap_first}TO);
    }

    /**
     * 新增表${tableInfo.tableOriginalName}的记录
     */
    @Override
    public void insert${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) {
        super._insert("insert${tableInfo.tableName?cap_first}", ${tableInfo.tableName?uncap_first}TO);
    }
    
    
    /**
     * 删除表${tableInfo.tableOriginalName}的记录
     */
    @Override
    public void delete${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) {
        super._delete("delete${tableInfo.tableName?cap_first}", ${tableInfo.tableName?uncap_first}TO);
    }

    /**
     * 查询表${tableInfo.tableOriginalName}的记录
     */
    @Override
    public ${tableInfo.tableName?cap_first}TO get${tableInfo.tableName?cap_first}(${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO) {
        return (${tableInfo.tableName?cap_first}TO) super._queryForObject("get${tableInfo.tableName?cap_first}", ${tableInfo.tableName?uncap_first}TO);
    }
}
