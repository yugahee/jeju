package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/*")
public class LoginCheckFilter implements Filter {
	private List<String> permitList;
	private List<String> resourceList;
    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		String uri = req.getRequestURI();
		//System.out.println(uri);
		
		/* 로그인 없이 요청이 허가 된 요청 값 리스트에 현재 요청이 포함되지 않았을 때 */
		if(!permitList.contains(uri)) {
			boolean isResourceFile = false;
			/* 요청 안에 "/resource/" 라는 문자열을 포함하고 있는 지 확인 */
			for(String str : resourceList) {
				if(uri.contains(str)) {
					isResourceFile = true;
					break;
				}
			}
			
			/* 허가 리스트에도 없는 요청이면서 리소스 파일도 아닌 경우 */
			if(!isResourceFile) {
				/* 로그인 상태 확인 */
				Member loginUser = (Member)req.getSession().getAttribute("loginUser");
				if(loginUser == null) {
					req.setAttribute("message", "올바르지 않은 요청 입니다.");
					req.getRequestDispatcher("/views/common/errorpage.jsp").forward(request, response);
					return;					
				}
			}			
		}
		

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		permitList = new ArrayList<String>();
		permitList.add("/jeju/");
		permitList.add("/jeju/ramdomRoom");
		permitList.add("/jeju/login");
		permitList.add("/jeju/findId");
		permitList.add("/jeju/join");
		permitList.add("/jeju/room/reservation");
		permitList.add("/jeju/reco/mainView");
		permitList.add("/jeju/reco/detailView");
		permitList.add("/jeju/mbti/mainView");
		permitList.add("/jeju/mbti/resultView");
		permitList.add("/jeju/mbti/test1");
		permitList.add("/jeju/mbti/test2");
		permitList.add("/jeju/mbti/test3");
		permitList.add("/jeju/mbti/test4");
		permitList.add("/jeju/admin/login");
		
		resourceList = new ArrayList<String>();
		resourceList.add("/resources/");
	}

}
