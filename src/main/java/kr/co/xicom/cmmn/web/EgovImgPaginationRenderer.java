/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.xicom.cmmn.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/**
 * @Class Name : ImagePaginationRenderer.java
 * @Description : ImagePaginationRenderer Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public EgovImgPaginationRenderer() {
		// no-op
	}

	/**
	* PaginationRenderer
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {

		/*firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre10.gif' border=0/></a>&#160;";
		previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre1.gif' border=0/></a>&#160;";
		currentPageLabel = "<strong>{0}</strong>&#160;";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
		nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next1.gif' border=0/></a>&#160;";
		lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next10.gif' border=0/></a>&#160;";*/
		
		//firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre10.gif' border=0/></a>&#160;";
		//previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre1.gif' border=0/></a>&#160;";
		//currentPageLabel = "<li class=\"paginate active\"><a href=\"#\">{0}</a></li>";
		//otherPageLabel = "<li class=\"paginate\"><a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></li>";
		//nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next1.gif' border=0/></a>&#160;";
		//lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next10.gif' border=0/></a>&#160;";
		firstPageLabel = "<li class=\"paginate\">"
				+ "<a href=\"#\" class=\"\" onclick=\"{0}({1}); return false;\">"
/*				+ "<span class=\"glyphicon glyphicon-backward\" aria-hidden=\"true\"></span>"
				+ "<span class=\"sr-only\">첫페이지</span>"*/
				//+ "<i class=\"first\">처음 페이지</i>"
				+"<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre10.gif' border=0/ >"
				+ "</a>"
				+ "</li>&#160;";
		previousPageLabel = "<li class=\"paginate\">"
						+ "<a href=\"#\" class=\"\" onclick=\"{0}({1}); return false;\">"
						//+ "<span class=\"glyphicon glyphicon-triangle-left\" aria-hidden=\"true\"></span>"
						//+ "<span class=\"sr-only\">첫페이지</span>"
						//+ "<i class=\"prev\">이전 페이지</i>"
						+"<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_pre1.gif' border=0/ >"
						+ "</a>"
						+ "</li>&#160;";
		currentPageLabel = "<li class=\"paginate active\"><a href=\"#none\" class=\"on\">{0}</a></li>&#160;";
		otherPageLabel = "<li class=\"paginate\"><a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></li>&#160;";
		//nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next1.gif' border=0/></a>&#160;";
		//lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next10.gif' border=0/></a>&#160;";
		nextPageLabel = "<li class=\"paginate\">"
						+ "<a href=\"#\" class=\"\" onclick=\"{0}({1}); return false;\">"
/*						+ "<span class=\"glyphicon glyphicon-triangle-right\" aria-hidden=\"true\"></span>"
						+ "<span class=\"sr-only\">첫페이지</span>"*/
						//+ "<i class=\"next\">다음 페이지</i>"
						+"<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next1.gif' border=0/ >"
						+ "</a>"
						+ "</li>&#160;"; 
		lastPageLabel = "<li class=\"paginate\">"
						+ "<a href=\"#\" class=\"\" onclick=\"{0}({1}); return false;\">"
/*						+ "<span class=\"glyphicon glyphicon-forward\" aria-hidden=\"true\"></span>"
						+ "<span class=\"sr-only\">첫페이지</span>"*/
						//+ "<i class=\"last\">마지막 페이지</i>"
						+"<image src='" + servletContext.getContextPath() + "/images/egovframework/cmmn/btn_page_next10.gif' border=0/ >"
						+ "</a>"
						+ "</li>&#160;";
	
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
