package com.corner.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
    private static SqlSessionFactory sqlsession_f;

    static {
        try {
            String resource = "./com/corner/mybatis/config/config.xml";
            Reader reader = Resources.getResourceAsReader(resource);
            sqlsession_f = new SqlSessionFactoryBuilder().build(reader);
        }catch (IOException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException("초기화 문제 발생, SqlMapConfig.java ");
        }
    }

    public static SqlSessionFactory getSqlMapInstance() {
        return sqlsession_f;
    }
}
