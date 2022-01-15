package net.bizlogin.common.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanNameGenerator;

/**
 * Bean id에 package 경로까지 추가
 */
public class FullBeanNameGenerator implements BeanNameGenerator {

	private static final Logger logger = LoggerFactory.getLogger(FullBeanNameGenerator.class);

	@Override
	public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {

		//logger.info(definition.getResourceDescription());

		/*		if (definition instanceof AnnotatedBeanDefinition) {
					((AnnotatedBeanDefinition) definition).getMetadata().getAnnotationAttributes(null)
				}*/

		return definition.getBeanClassName();
	}

}
