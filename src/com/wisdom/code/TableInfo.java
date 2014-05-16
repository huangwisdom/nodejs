package com.wisdom.code;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;

public class TableInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键列 */
    ArrayList<ColumnInfo> primaryKeys = new ArrayList<ColumnInfo>();

    /** 非主键列 */
    ArrayList<ColumnInfo> columns = new ArrayList<ColumnInfo>();

    String tableName = null;

    String tableRemark = null;

    String tableOriginalName = null;

    String packageExtend = null;

    public String getPackageExtend() {
        return packageExtend;
    }

    public void setPackageExtend(String packageExtend) {
        this.packageExtend = packageExtend;
    }

    public String getTableOriginalName() {
        return tableOriginalName;
    }

    public void setTableOriginalName(String tableOriginalName) {
        this.tableOriginalName = tableOriginalName;
    }

    public String getTableRemark() {
        return tableRemark;
    }

    public void setTableRemark(String tableRemark) {
        this.tableRemark = tableRemark;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public ArrayList<ColumnInfo> getPrimaryKeys() {
        Collections.sort(primaryKeys);
        return primaryKeys;
    }

    public void setPrimaryKeys(ArrayList<ColumnInfo> primaryKeys) {
        this.primaryKeys = primaryKeys;
    }

    public ArrayList<ColumnInfo> getColumns() {
        Collections.sort(columns);
        return columns;
    }

    public void setColumns(ArrayList<ColumnInfo> columns) {
        this.columns = columns;
    }

    public void addPrimaryKey(ColumnInfo primaryKey) {
        if (this.primaryKeys.contains(primaryKey)) {
            return;
        }
        this.primaryKeys.add(primaryKey);
    }

    public void addColumn(ColumnInfo column) {
        if (this.columns.contains(column)) {
            return;
        }
        this.columns.add(column);
    }

    @Override
    public int hashCode() {
        return this.tableName.hashCode();
    }

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("\n");
        sb.append(tableName);
        sb.append("\n{\n");
        for (ColumnInfo tmp : this.getPrimaryKeys()) {
            sb.append(tmp.toString());
        }
        for (ColumnInfo tmp : this.getColumns()) {
            sb.append(tmp.toString());
        }
        sb.append("}\n");
        return sb.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof TableInfo) {
            TableInfo tmp = (TableInfo) obj;
            return this.tableName.equals(tmp.getTableName());
        }
        return false;
    }
}
