package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paic.icore.fa.logging.Log;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.service}.${tableInfo.tableName?cap_first}Service;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO;
import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.form}.${tableInfo.tableName?cap_first}Form;
import com.paic.pafa.app.biz.service.BusinessServiceException;
import com.paic.pafa.exceptions.AppException;
import com.paic.pafa.web.BaseRest;

/**
 * @author HUANGZHIHUI300
 * 日期：${today?string("yyyy-MM-dd HH:mm:ss")}
 * 用途：数据库表${tableInfo.tableOriginalName}对应的Action
 */
@Controller
public class ${tableInfo.tableName?cap_first}Action extends BaseRest {

    @Autowired
    private Log log;

    @Autowired
    private ${tableInfo.tableName?cap_first}Service ${tableInfo.tableName?uncap_first}Service;

    @RequestMapping(value = "/app/${tableInfo.tableName?uncap_first}/list")
    public ${tableInfo.tableName?cap_first}Form get${tableInfo.tableName?cap_first}List(@ModelAttribute ${tableInfo.tableName?cap_first}Form ${tableInfo.tableName?uncap_first}Form) throws AppException {

        this.log.trace("app get ${tableInfo.tableName?uncap_first} list log");

        ${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO = new ${tableInfo.tableName?cap_first}TO();
        try {
            BeanUtils.copyProperties(${tableInfo.tableName?uncap_first}TO, ${tableInfo.tableName?uncap_first}Form);
        } catch (Exception e) {
            log.error("对象转换失败：" + e.getMessage());
            throw new AppException("对象转换失败：" + e.getMessage());
        }
        
        try {
            ${tableInfo.tableName?uncap_first}Form.set${tableInfo.tableName?cap_first}List(${tableInfo.tableName?uncap_first}Service.get${tableInfo.tableName?cap_first}List(${tableInfo.tableName?uncap_first}TO));
            return ${tableInfo.tableName?uncap_first}Form;
        } catch (BusinessServiceException e) {
            log.error("查询${tableInfo.tableRemark}的结果列表失败：" + e.getMessage());
            throw new AppException("查询${tableInfo.tableRemark}的结果列表失败：" + e.getMessage());
        }
    }
    
    @RequestMapping(value = "/app/${tableInfo.tableName?uncap_first}/get")
    public ${tableInfo.tableName?cap_first}Form get${tableInfo.tableName?cap_first}(@ModelAttribute ${tableInfo.tableName?cap_first}Form ${tableInfo.tableName?uncap_first}Form) throws AppException {

        this.log.trace("app get ${tableInfo.tableName?uncap_first} log");

        ${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO = new ${tableInfo.tableName?cap_first}TO();
        List<${tableInfo.tableName?cap_first}TO> ${tableInfo.tableName?uncap_first}List = new ArrayList<${tableInfo.tableName?cap_first}TO>();
        
        try {
            BeanUtils.copyProperties(${tableInfo.tableName?uncap_first}TO, ${tableInfo.tableName?uncap_first}Form);
        } catch (Exception e) {
            log.error("对象转换失败：" + e.getMessage());
            throw new AppException("对象转换失败：" + e.getMessage());
        }
        
        try {
            ${tableInfo.tableName?uncap_first}List.add(${tableInfo.tableName?uncap_first}Service.get${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO));
            ${tableInfo.tableName?uncap_first}Form.set${tableInfo.tableName?cap_first}List(${tableInfo.tableName?uncap_first}List);
            return ${tableInfo.tableName?uncap_first}Form;
        } catch (BusinessServiceException e) {
            log.error("查询${tableInfo.tableRemark}失败：" + e.getMessage());
            throw new AppException("查询${tableInfo.tableRemark}失败：" + e.getMessage());
        }
    }
    
    @RequestMapping(value = "/app/${tableInfo.tableName?uncap_first}/save")
    public void save${tableInfo.tableName?cap_first}(@ModelAttribute ${tableInfo.tableName?cap_first}Form ${tableInfo.tableName?uncap_first}Form) throws AppException {

        this.log.trace("app save ${tableInfo.tableName?uncap_first} log");

        ${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO = new ${tableInfo.tableName?cap_first}TO();
        try {
            ${tableInfo.tableName?uncap_first}Service.insert${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO);
        } catch (BusinessServiceException e) {
            log.error("保存${tableInfo.tableRemark}失败：" + e.getMessage());
            throw new AppException("保存${tableInfo.tableRemark}失败：" + e.getMessage());
        }
    }
    
    @RequestMapping(value = "/app/${tableInfo.tableName?uncap_first}/delete")
    public void delete${tableInfo.tableName?cap_first}(@ModelAttribute ${tableInfo.tableName?cap_first}Form ${tableInfo.tableName?uncap_first}Form) throws AppException {

        this.log.trace("app delete ${tableInfo.tableName?uncap_first} log");

        ${tableInfo.tableName?cap_first}TO ${tableInfo.tableName?uncap_first}TO = new ${tableInfo.tableName?cap_first}TO();
        try {
            ${tableInfo.tableName?uncap_first}Service.delete${tableInfo.tableName?cap_first}(${tableInfo.tableName?uncap_first}TO);
        } catch (BusinessServiceException e) {
            log.error("删除${tableInfo.tableRemark}失败：" + e.getMessage());
            throw new AppException("删除${tableInfo.tableRemark}失败：" + e.getMessage());
        }
    }

    public ${tableInfo.tableName?cap_first}Service get${tableInfo.tableName?cap_first}Service() {
        return ${tableInfo.tableName?uncap_first}Service;
    }

    public void set${tableInfo.tableName?cap_first}Service(${tableInfo.tableName?cap_first}Service ${tableInfo.tableName?uncap_first}Service) {
        this.${tableInfo.tableName?uncap_first}Service = ${tableInfo.tableName?uncap_first}Service;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    public Log getLog() {
        return log;
    }
}
