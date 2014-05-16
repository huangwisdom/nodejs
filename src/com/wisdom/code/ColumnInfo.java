package com.wisdom.code;

public class ColumnInfo implements Comparable<ColumnInfo> {

    private String columnName = "";
    
    private String columnOriginalName = "";

    private String columnNameDef = "";

    private String columnType = "";

    private String defaultValue = "";

    private String columnRemark = "";

    boolean notNull = false;

    boolean primaryKey = false;

    int columnLength = 0;

    int columnOrder = 0;

    boolean isDecimal = false;

    int decimalLength = 0;

    private String columnTypeDB = "";

    private String defaultValueDB = "";

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
    
    public String getColumnOriginalName() {
        return columnOriginalName;
    }

    public void setColumnOriginalName(String columnOrginalName) {
        this.columnOriginalName = columnOrginalName;
    }
    
    public String getColumnNameDef() {
        return columnNameDef;
    }

    public void setColumnNameDef(String columnNameDef) {
        this.columnNameDef = columnNameDef;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getColumnRemark() {
        return columnRemark;
    }

    public void setColumnRemark(String columnRemark) {
        if (columnRemark == null) {
            columnRemark = "";
        }
        this.columnRemark = columnRemark;
    }

    public boolean isNotNull() {
        return notNull;
    }

    public void setNotNull(boolean notNull) {
        this.notNull = notNull;
    }

    public boolean isPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(boolean primaryKey) {
        this.primaryKey = primaryKey;
    }

    public int getColumnLength() {
        return columnLength;
    }

    public void setColumnLength(int columnLength) {
        this.columnLength = columnLength;
    }

    public int getColumnOrder() {
        return columnOrder;
    }

    public void setColumnOrder(int columnOrder) {
        this.columnOrder = columnOrder;
    }

    public boolean isDecimal() {
        return isDecimal;
    }

    public void setDecimal(boolean isDecimal) {
        this.isDecimal = isDecimal;
    }

    public int getDecimalLength() {
        return decimalLength;
    }

    public void setDecimalLength(int decimalLength) {
        this.decimalLength = decimalLength;
    }

    public String getColumnTypeDB() {
        return columnTypeDB;
    }

    public void setColumnTypeDB(String columnTypeDB) {
        this.columnTypeDB = columnTypeDB;
    }

    public String getDefaultValueDB() {
        return defaultValueDB;
    }

    public void setDefaultValueDB(String defaultValueDB) {
        this.defaultValueDB = defaultValueDB;
    }

    @Override
    public int hashCode() {
        return this.columnName.hashCode();
    }

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(columnName);
        sb.append(" ");
        sb.append(columnType);
        sb.append(" ");
        sb.append(primaryKey);
        sb.append(" ");
        sb.append(",\n");
        return sb.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof ColumnInfo) {
            ColumnInfo tmp = (ColumnInfo) obj;
            return this.columnName.equals(tmp.getColumnName());
        }
        return false;
    }

    public int compareTo(ColumnInfo o) {
        if (this.columnOrder > o.columnOrder) {
            return 1;
        } else if (this.columnOrder < o.columnOrder) {
            return -1;
        }
        return 0;
    }
}
