package jdbc.web.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.util.ObjectUtil;

/**
 * 静态文件禁止缓存
 * 
 * @author wwp
 * @date 2018-4-20
 */
public class FileCacheFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;

		String requestURL = req.getRequestURL().toString();
		String queryStr = req.getQueryString();

		// 不带参数，并且不包含字符串 'jquery', 'extjs'
		if (requestURL.endsWith(".js") || requestURL.endsWith(".css")) {
			if (ObjectUtil.isEmpty(queryStr) && requestURL.indexOf("jquery") == -1 && requestURL.indexOf("extjs") == -1) {
				String newURL = requestURL + "?v=" + new Date().getTime();
				resp.sendRedirect(newURL);
				return;
			}
		}

		chain.doFilter(arg0, arg1);
		return;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
