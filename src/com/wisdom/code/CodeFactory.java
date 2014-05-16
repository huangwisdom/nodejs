package com.wisdom.code;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.wisdom.code.config.CodeConfig;
import com.wisdom.code.config.TemplateConfig;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class CodeFactory {

    private static final String CONFIG_FILE = "D:/EclipseWS/rims_codegen/src/code-config.xml";

    private static final String CODE_CONFIG_ALIAS = "code-config";

    /**
     * 生成代码
     */
    public void generate() throws Exception {
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(CodeFactory.class, "");
        cfg.setObjectWrapper(new DefaultObjectWrapper());

        CodeConfig config = getConfig();

        CodeUtils collectUtils = new CodeUtils();
        List<TableInfo> tableInfos = collectUtils.collect(config);

        doGenerate(cfg, config, tableInfos);
    }

    private CodeConfig getConfig() {

        XStream configParser = new XStream(new DomDriver());
        configParser.autodetectAnnotations(true);
        configParser.alias(CODE_CONFIG_ALIAS, CodeConfig.class);
        CodeConfig config = new CodeConfig();

        try {
            FileInputStream fileInputStream = new FileInputStream(CONFIG_FILE);
            configParser.fromXML(fileInputStream, config);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return config;
    }

    private void doGenerate(Configuration cfg, CodeConfig config, List<TableInfo> tables) throws Exception {

        mkBaseDir(config);

        List<TemplateConfig> templates = config.getTemplates();
        for (TemplateConfig templateConfig : templates) {
            if (templateConfig.isDisable()) {
                continue;
            }
            Template entity = cfg.getTemplate(templateConfig.getPath());
            for (TableInfo tableInfo : tables) {
                String realSourcePath = getRealSourcePath(config, templateConfig, tableInfo);
                mkdir(realSourcePath);
                Map<String, Object> root = new HashMap<String, Object>();
                root.put("tableInfo", tableInfo);
                root.put("codeConfig", config);
                root.put("templateConfig", templateConfig);
                root.put("packageTree", config.getPackageTree());
                root.put("today", new Date());
                Writer out = new OutputStreamWriter(new FileOutputStream(realSourcePath + getFileName(templateConfig, tableInfo)));
                entity.process(root, out);
                out.flush();
                out.close();
            }
        }
    }

    private String getFileName(TemplateConfig templateConfig, TableInfo tableInfo) {
        String tableName = "";
        if ("lowercase".equals(templateConfig.getTableNameHandler())) {
            tableName = tableInfo.getTableName().toLowerCase();
        } else {
            tableName = upperFirst(tableInfo.getTableName());
        }

        String fileName = templateConfig.getPrefix() + tableName + templateConfig.getSuffix() + "." + templateConfig.getFileType();

        return fileName;
    }
    
    private void mkBaseDir(CodeConfig config) {
        String dir = config.getWorkspacePath() + "/" + config.getPackageBase() + "/";
        dir = dir.replaceAll("\\.", "/").replaceAll("//", "/");
        mkdir(dir);
    }

    private String getRealSourcePath(CodeConfig config, TemplateConfig templateConfig, TableInfo tableInfo) {

        String baseDir = config.getWorkspacePath() + "/" + config.getPackageBase() + "/";

        String extendPath = tableInfo.getPackageExtend() + "/" + templateConfig.getPackageExtend() + "/";

        String realSourcePath = baseDir + "/" + extendPath;

        return realSourcePath.replaceAll("\\.", "/").replaceAll("//", "/");
    }

    private void mkdir(String path) {
        StringTokenizer tokenizer = new StringTokenizer(path, "/");
        File file = null;
        String strPathName = "";
        while (tokenizer.hasMoreTokens()) {
            strPathName = strPathName + tokenizer.nextToken() + "/";
            file = new File(strPathName);
            if (!file.exists()) {
                file.mkdir();
            }
        }
    }

    private String upperFirst(String value) {
        String result = value;
        if (value != null && value.length() > 0) {
            result = value.substring(0, 1).toUpperCase() + value.substring(1);
        }
        return result;
    }
}
