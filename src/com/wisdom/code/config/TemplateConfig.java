package com.wisdom.code.config;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("template")
public class TemplateConfig {

    private String name;

    @XStreamAlias("package-extend")
    private String packageExtend;

    private String path;

    private String suffix;
    
    private String prefix;
    
    @XStreamAlias("file-type")
    private String fileType;
    
    private boolean disable;

    @XStreamAlias("table-name-handler")
    private String tableNameHandler;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPackageExtend() {
        return packageExtend;
    }

    public void setPackageExtend(String packageExtend) {
        this.packageExtend = packageExtend;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }
    
    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    
    public boolean isDisable() {
        return disable;
    }

    public void setDisable(boolean disable) {
        this.disable = disable;
    }
    
    public String getTableNameHandler() {
        return tableNameHandler;
    }

    public void setTableNameHandler(String tableNameHandler) {
        this.tableNameHandler = tableNameHandler;
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
