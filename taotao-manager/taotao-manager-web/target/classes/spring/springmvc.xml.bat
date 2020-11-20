<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:p="http://www.springframework.org/schema/p"
	   xmlns:context="http://www.springframework.org/schema/context"
	   xmlns:mvc="http://www.springframework.org/schema/mvc"
	   xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
	   xsi:schemaLocation="
	http://www.springframework.org/schema/beans
	 http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc-4.0.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd
           http://code.alibabatech.com/schema/dubbo
        http://code.alibabatech.com/schema/dubbo/dubbo.xsd
        ">


	<!-- 自定义消费方名字 -->
	<dubbo:application name="taotao-manager"/>

	<!-- 注册中心地址 -->
	<dubbo:registry address="zookeeper://123.57.190.18:2181"  />
	<dubbo:consumer timeout="120000"/>
	<!-- 扫描的controller包 -->
	<dubbo:annotation package="com.taotao.controller"/>
	<mvc:resources location="/WEB-INF/css/" mapping="/css/**"/>
	<mvc:resources location="/WEB-INF/js/" mapping="/js/**"/>
	<mvc:resources location="/WEB-INF/assets" mapping="/js/**"/>
	<mvc:resources location="/WEB-INF/assets" mapping="/css/**"/>
	<mvc:resources location="/WEB-INF/img" mapping="/jpg/**"/>
	<mvc:resources location="/WEB-INF/img" mapping="/png/**"/>
	<mvc:annotation-driven />

	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/jsp/" />
		<property name="suffix" value=".jsp" />
	</bean>
	<!-- 定义文件上传解析器 -->
	<bean id="multipartResolver"
		class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<!-- 设定默认编码 -->
		<property name="defaultEncoding" value="UTF-8"></property>
		<!-- 设定文件上传的最大值5MB，5*1024*1024 -->
		<property name="maxUploadSize" value="20971520"></property>
	</bean>


</beans>
