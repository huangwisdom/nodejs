package com.wisdom.code;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.wisdom.code.config.CodeConfig;
import com.wisdom.code.config.DatabaseConfig;
import com.wisdom.code.config.TableConfig;
import com.wisdom.code.converter.IBooleanConverter;
import com.wisdom.code.converter.IDefaultValueConverter;
import com.wisdom.code.converter.INameConverter;
import com.wisdom.code.converter.ITypeConverter;
import com.wisdom.code.converter.impl.DefaultBooleanConverter;
import com.wisdom.code.converter.impl.DefaultNameConverter;
import com.wisdom.code.converter.impl.DefaultTypeConverter;
import com.wisdom.code.converter.impl.DefaultValueConverter;

public class CodeUtils {

    private Connection connect(DatabaseConfig database) throws Exception {
        Class.forName(database.getDriver()).newInstance();
        Connection conn = DriverManager.getConnection(database.getUrl(), database.getUser(), database.getPassword());
        return conn;
    }

    private TableInfo collectTable(Connection conn, TableInfo table) throws Exception {
        StringBuffer sql = new StringBuffer(200);
        sql.append("SELECT * FROM DBA_TAB_COMMENTS WHERE TABLE_NAME = '");
        sql.append(table.getTableOriginalName().toUpperCase());
        sql.append("'");

        ResultSet rs = conn.createStatement().executeQuery(sql.toString());
        // printResultSet(rs);
        if (rs.next()) {
            table.setTableOriginalName(rs.getString("TABLE_NAME"));
            table.setTableName(nameConverter.convert(table.getTableOriginalName()));
            table.setTableRemark(rs.getString("COMMENTS"));
        }
        rs.close();
        return table;
    }

    private TableInfo collectColumn(Connection conn, TableInfo table) throws Exception {

        StringBuffer sql = new StringBuffer(200);
        sql.append("SELECT A.*, B.COMMENTS                      ");
        sql.append("  FROM DBA_TAB_COLUMNS A, DBA_COL_COMMENTS B");
        sql.append(" WHERE A.OWNER = B.OWNER                    ");
        sql.append("   AND A.TABLE_NAME = B.TABLE_NAME          ");
        sql.append("   AND A.COLUMN_NAME = B.COLUMN_NAME        ");
        sql.append("   AND A.TABLE_NAME = '");
        sql.append(table.getTableOriginalName().toUpperCase());
        sql.append("'");
        sql.append(" ORDER BY A.COLUMN_ID                       ");

        ResultSet rs = conn.createStatement().executeQuery(sql.toString());
        // printResultSet(rs);
        while (rs.next()) {
            ColumnInfo column = new ColumnInfo();
            column.setColumnOriginalName(rs.getString("COLUMN_NAME"));
            column.setColumnName(nameConverter.convert(column.getColumnOriginalName()));
            column.setColumnNameDef(nameConverter.convertDef(column.getColumnOriginalName()));
            column.setColumnRemark(rs.getString("COMMENTS"));
            column.setDecimal(booleanConverter.convert(rs.getString("DATA_SCALE")));
            column.setColumnType(typeConverter.convert(rs.getString("DATA_TYPE"), column.isDecimal()));
            column.setColumnTypeDB(rs.getString("DATA_TYPE"));
            column.setColumnLength(rs.getInt("DATA_LENGTH"));
            column.setColumnOrder(rs.getInt("COLUMN_ID"));
            column.setNotNull(booleanConverter.convert(rs.getString("NULLABLE")));
            column.setPrimaryKey(false);
            column.setDefaultValue(defaultValueConverter.convert(column.getColumnType()));
            table.addColumn(column);
        }
        rs.close();

        return table;
    }

    public void printResultSet(ResultSet rs) throws Exception {
        ResultSetMetaData rsme = rs.getMetaData();

        int columnCount = rsme.getColumnCount();
        System.out.println("ResultSet Column Count:" + columnCount);
        while (rs.next()) {
            System.out.println();
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(" " + rsme.getColumnName(i));
                System.out.print(" : " + rs.getString(rsme.getColumnName(i)) + ";");
            }
        }
    }

    public List<TableInfo> collect(CodeConfig config) throws Exception {
        Connection conn = this.connect(config.getDatabase());

        List<TableConfig> tables = config.getTables();
        List<TableInfo> result = new ArrayList<TableInfo>();
        for (TableConfig table : tables) {
            TableInfo tableInfo = new TableInfo();
            tableInfo.setTableName(table.getTableName());
            tableInfo.setTableOriginalName(table.getTableName());
            tableInfo.setPackageExtend(table.getPackageExtend());

            this.collectTable(conn, tableInfo);
            this.collectColumn(conn, tableInfo);
            result.add(tableInfo);
        }
        conn.close();
        return result;
    }

    private IDefaultValueConverter defaultValueConverter = new DefaultValueConverter();

    private ITypeConverter typeConverter = new DefaultTypeConverter();

    private IBooleanConverter booleanConverter = new DefaultBooleanConverter();

    private INameConverter nameConverter = new DefaultNameConverter();

    public INameConverter getNameConverter() {
        return nameConverter;
    }

    public void setNameConverter(INameConverter nameConverter) {
        this.nameConverter = nameConverter;
    }

    public IBooleanConverter getBooleanConverter() {
        return booleanConverter;
    }

    public void setBooleanConverter(IBooleanConverter booleanConverter) {
        this.booleanConverter = booleanConverter;
    }

    public ITypeConverter getTypeConverter() {
        return typeConverter;
    }

    public void setTypeConverter(ITypeConverter typeConverter) {
        this.typeConverter = typeConverter;
    }

    public IDefaultValueConverter getDefaultValueConverter() {
        return defaultValueConverter;
    }

    public void setDefaultValueConverter(IDefaultValueConverter defaultValueConverter) {
        this.defaultValueConverter = defaultValueConverter;
    }
}
