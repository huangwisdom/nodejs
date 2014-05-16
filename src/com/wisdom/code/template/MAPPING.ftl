<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//iBATIS.com//DTD SQL Map 2.0//EN" "http://www.ibatis.com/dtd/sql-map-2.dtd">
<#macro formatkey keys>
<#list keys as key>
<#nested key,key_index==0>
</#list>
</#macro>
<sqlMap namespace="pafaapp">
    <resultMap id="${tableInfo.tableName?uncap_first}Map" class="${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO">
    <#list tableInfo.columns as column>
        <result property="${column.columnNameDef?uncap_first}" column="${column.columnOriginalName}"></result>
    </#list>
    </resultMap>
    
    <select id="get${tableInfo.tableName?cap_first}List" parameterClass="${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO" resultMap="${tableInfo.tableName?uncap_first}Map">
        SELECT <@formatkey tableInfo.columns; column, first><#if first>${column.columnOriginalName?cap_first}<#else>, ${column.columnOriginalName?cap_first}</#if></@formatkey>
        FROM ${tableInfo.tableOriginalName?cap_first}
        WHERE 1 = 2
    </select>
    
    <insert id="insert${tableInfo.tableName?cap_first}" parameterClass="${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO"> 
        INSERT INTO ${tableInfo.tableOriginalName?cap_first} (
            <@formatkey tableInfo.columns; column, first><#if first>${column.columnOriginalName?cap_first}<#else>, ${column.columnOriginalName?cap_first}</#if></@formatkey>
        ) VALUES (
            <@formatkey tableInfo.columns; column, first><#if first>#${column.columnNameDef?uncap_first}#<#else>, #${column.columnNameDef?uncap_first}#</#if></@formatkey>
        )
    </insert>
    
    <delete id="delete${tableInfo.tableName?cap_first}" parameterClass="${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO">
        DELETE FROM ${tableInfo.tableOriginalName?cap_first} WHERE 1 = 2
    </delete>
    
    <select id="get${tableInfo.tableName?cap_first}" parameterClass="${codeConfig.packageBase}.${tableInfo.packageExtend}.${packageTree.dto}.${tableInfo.tableName?cap_first}TO" resultMap="${tableInfo.tableName?uncap_first}Map">
        SELECT <@formatkey tableInfo.columns; column, first><#if first>${column.columnOriginalName?cap_first}<#else>, ${column.columnOriginalName?cap_first}</#if></@formatkey>
        FROM ${tableInfo.tableOriginalName?cap_first}
        WHERE 1 = 2
    </select>
</sqlMap>
