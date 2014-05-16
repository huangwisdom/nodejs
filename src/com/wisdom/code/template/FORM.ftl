package ${codeConfig.packageBase}.${tableInfo.packageExtend}.${templateConfig.packageExtend};

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import ${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO;

public class ${tableInfo.tableName?cap_first}Form extends ${tableInfo.tableName?cap_first}TO implements Serializable {

    private static final long serialVersionUID = ${tableInfo.tableName?cap_first}Form.class.getName().hashCode();

    private List<${tableInfo.tableName?cap_first}TO> ${tableInfo.tableName?uncap_first}List;

    public List<${tableInfo.tableName?cap_first}TO> get${tableInfo.tableName?cap_first}List() {
        return ${tableInfo.tableName?uncap_first}List;
    }

    public void set${tableInfo.tableName?cap_first}List(List<${tableInfo.tableName?cap_first}TO> ${tableInfo.tableName?uncap_first}List) {
        this.${tableInfo.tableName?uncap_first}List = ${tableInfo.tableName?uncap_first}List;
    }
    
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
