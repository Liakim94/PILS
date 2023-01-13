package kr.go.smes.tags;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Enumeration;

public class Pagenater extends SimpleTagSupport {

    /**
     * 페이징 처리 대상의 전체 Row 수
     */
    private int totalRowCount = 0;

    /**
     * 페이지 당 Row 수
     */
    private int pageRowSize = 10;

    /**
     * 현재 Page
     */
    private int currentPage = 1;

    /**
     * 링크 타겟
     */
    private String target = "";

    /**
     * 페이징 처리 대상의 전체 Row 수 설정
     * @param count
     */
    public void setTotalRowCount(int count) {
        this.totalRowCount = count;
    }

    /**
     * 페이지 당 Row 수 설정
     * @param size
     */
    public void setPageRowSize(int size) {
        this.pageRowSize = size;
    }

    /**
     * 현재 Page 설정
     * @param page
     */
    public void setCurrentPage(int page) {
        this.currentPage = page;
    }

    /**
     * 링크 타겟 설정.
     * @param target
     */
    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public void doTag() throws JspException, IOException {
        try {
            int pageListSize = 10;

            // 전체 페이지 수 추출
            int totalPage = (int)Math.ceil(totalRowCount / (double) pageRowSize);
            // 시작 페이지 번호 구하기
            int startPage = pageListSize * ((currentPage - 1) / pageListSize) + 1;
            // 종료 페이지 번호 구하기
            int endPage = startPage + pageListSize - 1;

            if (endPage > totalPage) {
                endPage = totalPage;
            }

            PageContext context = (PageContext) this.getJspContext();
            HttpServletRequest request = (HttpServletRequest) context.getRequest();

            Enumeration<String> paramNames = request.getParameterNames();

            StringBuilder paramBuilder = new StringBuilder("?");
            String paramName = "";
            String paramValue = "";

            while (paramNames.hasMoreElements()) {
                paramName = paramNames.nextElement();
                paramValue = request.getParameter(paramName);
                if (!"pageNumber".equals(paramName)) {
                    if (!StringUtils.isEmpty(paramValue)) {
                        paramBuilder.append(paramName);
                        paramBuilder.append("=");
                        paramBuilder.append(paramValue);
                        paramBuilder.append("&");
                    }
                }
            }

            paramBuilder.append("pageNumber=");

            // 페이지 링크 만들기.
            // Tag Body 데이터 추출하여 linkUrl로 설정한다.
            StringWriter sw = new StringWriter();
            getJspBody().invoke(sw);
            String linkUrl = sw.toString().trim();
            // 파라미터 추가
            linkUrl += paramBuilder.toString().trim();

            JspWriter out = context.getOut();
            out.write("<div class=\"page-navi-area\"><ul class=\"paging-list\">");

            // 이전 페이지 이동 링크 처리
            out.write("<li>");
            if (currentPage > 1) {
                out.write("<li><a class=\"page-prev\" href=\"");
                out.write(linkUrl + (currentPage - 1));
                out.write("\" target=\"");
                out.write(this.target);
                out.write("\">...</a></li>");
            }
            else {
                out.write("<span class=\"page-prev disabled\">...</span>");
            }
            out.write("</li>");

            // 페이지 링크 리스트 처리
            for (int i=startPage; i<=endPage; i++) {
                out.write("<li>");
                if (i == currentPage) {
                    out.write("<span class=\"page-link current\">" + i + "</span>");
                }
                else {
                    out.write("<a class=\"page-link\" href=\"");
                    out.write(linkUrl + i);
                    out.write("\" target=\"");
                    out.write(this.target);
                    out.write("\">" + i + "</a>");
                }
                out.write("</li>");
            }

            // 다음 페이지 이동 링크 처리
            out.write("<li>");
            if (currentPage < totalPage) {
                out.write("<a class=\"page-next\" href=\"");
                out.write(linkUrl + (currentPage + 1));
                out.write("\" target=\"");
                out.write(this.target);
                out.write("\">...</a>");
            }
            else {
                out.write("<span class=\"page-next disabled\">...</span>");
            }
            out.write("</li>");

            out.write("</ul></div>");
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
