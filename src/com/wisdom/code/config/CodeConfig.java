package com.wisdom.code.config;

import java.util.List;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

@XStreamAlias("code-config")
public class CodeConfig {

    @XStreamAlias("package-base")
    private String packageBase;
    
    @XStreamAlias("workspace-path")
    private String workspacePath;
    
    private DatabaseConfig database;
    
    @XStreamImplicit(itemFieldName = "template")
    private List<TemplateConfig> templates;
    
    @XStreamImplicit(itemFieldName = "table")
    private List<TableConfig> tables;
    
    @XStreamAlias("package-tree")
    private PackageTreeConfig packageTree;
    
    public String getPackageBase() {
        return packageBase;
    }

    public void setPackageBase(String packageBase) {
        this.packageBase = packageBase;
    }

    public String getWorkspacePath() {
        return workspacePath;
    }

    public void setWorkspacePath(String workspacePath) {
        this.workspacePath = workspacePath;
    }

    public DatabaseConfig getDatabase() {
        return database;
    }

    public void setDatabase(DatabaseConfig database) {
        this.database = database;
    }

    public List<TemplateConfig> getTemplates() {
        return templates;
    }

    public void setTemplates(List<TemplateConfig> templates) {
        this.templates = templates;
    }

    public List<TableConfig> getTables() {
        return tables;
    }

    public void setTables(List<TableConfig> tables) {
        this.tables = tables;
    }
    
    public PackageTreeConfig getPackageTree() {
        return packageTree;
    }

    public void setPackageTree(PackageTreeConfig packageTree) {
        this.packageTree = packageTree;
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
