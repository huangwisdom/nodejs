/************************************************************************
 * 描述 ：数据库表${tableInfo.tableOriginalName}对应的DTO，不允许修改，全部自动生成。
 * 作者 ：HUANGZHIHUI300
 * 日期 ：${today?string("yyyy-MM-dd HH:mm:ss")}
 *
 ************************************************************************/

package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.util.Date;
<#assign isExistBigDecimal = 'false'>
<#list tableInfo.columns as column>
    <#if column.columnType='BigDecimal'><#assign isExistBigDecimal = 'true'></#if>
</#list>
<#list tableInfo.primaryKeys as primaryKey>
    <#if primaryKey.columnType='BigDecimal'><#assign isExistBigDecimal = 'true'></#if>
</#list>
<#if isExistBigDecimal == 'true'>
import java.math.BigDecimal;
</#if>

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import com.paic.icore.rims.common.util.CommonConstants;
import com.paic.icore.rims.common.util.DateSerializer;
import com.paic.pafa.app.dto.PafaDTO;

public class ${tableInfo.tableName?cap_first}TO extends PafaDTO {

    private static final long serialVersionUID = ${tableInfo.tableName?cap_first}TO.class.getName().hashCode();
<#list tableInfo.primaryKeys as primaryKey>

    /** ${primaryKey.columnRemark} */
    <#if primaryKey.columnType == 'Date'>
    @DateTimeFormat(pattern = CommonConstants.YEAR_TO_DATE)
    </#if>   
    private ${primaryKey.columnType} ${primaryKey.columnNameDef?uncap_first};
 
</#list>
<#list tableInfo.columns as column>

    /** ${column.columnRemark} */
    <#if column.columnType == 'Date'>
    @DateTimeFormat(pattern = CommonConstants.YEAR_TO_DATE)
    </#if> 
    private ${column.columnType} ${column.columnNameDef?uncap_first};
</#list>
<#list tableInfo.primaryKeys as primaryKey>

    /**
     * 设置属性${primaryKey.columnRemark}的值
     */
    public void set${primaryKey.columnName?cap_first}(${primaryKey.columnType} ${primaryKey.columnName?uncap_first}) {
        this.${primaryKey.columnNameDef?uncap_first} = ${primaryKey.columnName?uncap_first};
    }

    /**
     * 获取属性${primaryKey.columnRemark}的值
     */
    <#if primaryKey.columnType == 'Date'>
    @JsonSerialize(using = DateSerializer.class)
    </#if>        
    public ${primaryKey.columnType} get${primaryKey.columnName?cap_first}() {
        return this.${primaryKey.columnNameDef?uncap_first};
    }
</#list>
<#list tableInfo.columns as column>

    /**
     * 设置属性${column.columnRemark}的值
     */
    public void set${column.columnName?cap_first}(${column.columnType} ${column.columnNameDef?uncap_first}) {
        this.${column.columnNameDef?uncap_first} = ${column.columnNameDef?uncap_first};
    }

    /**
     * 获取属性${column.columnRemark}的值
     */
    <#if column.columnType == 'Date'>
    @JsonSerialize(using = DateSerializer.class)
    </#if>
    public ${column.columnType} get${column.columnName?cap_first}() {
        return this.${column.columnNameDef?uncap_first};
    }
</#list>

    @Override
    public boolean equals(Object obj) {
        return EqualsBuilder.reflectionEquals(this, obj);
    }

    @Override
    public int hashCode() {
        return HashCodeBuilder.reflectionHashCode(this);
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}
