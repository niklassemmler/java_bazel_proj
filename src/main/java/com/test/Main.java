package com.test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Main {
    public static Logger logger = LogManager.getLogger();

    public static void main(String[] args) {
        logger.info("foo");
        System.out.println("Hello, World!");
    }
}
