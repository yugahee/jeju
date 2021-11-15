package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.PwdEncryptWrapper;






/**
 * Servlet Filter implementation class EncryptFilter
 */

// 암호화 적용 시킬 서블릿 = 로그인, 회원가입, 비밀번호 수정
// servletName을 기준으로 매핑
@WebFilter(filterName="encrypt", servletNames= {"LoginServlet", "JoinServlet", "PwdModifyServlet", "pwdReset", "AdminLogin", "AdminModify"})
	
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
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
		
		/* PwdEncryptWrapper클래스에서 매개변수로 받아 온 ServletRequest를 
		 * HttpServletRequest로 다운 캐스팅해서 Wrapper 객체의 생성자로 전달
		 * */
		PwdEncryptWrapper encWrapper = new PwdEncryptWrapper((HttpServletRequest)request);

		// filter가 여러 개일 경우 필터끼리 연결~서블릿으로 연결되게 filter chain
		/* getParameter는 서블릿에서 요청에 포함된 값을 가져올 때 사용하는 메소드인데 (ex: request.getParameter("userId");) 
		 * EncryptFilter와 연결한 3개의 서블릿에서 getParameter를 호출하면
		 * EncryptWrapper에 오버라이딩된 메소드가 호출 되고
		 * 그 안에서 password와 관련된 값들은 평문이 아닌 가공 된 문자로 처리됨
		 * */ 
		chain.doFilter(encWrapper, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
