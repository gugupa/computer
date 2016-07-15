package util;

import java.util.Map;

import org.aopalliance.intercept.Invocation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptors extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception {
//		Map<String,Object> sessionValues = invocation.getInvocationContext().getSession();
//		String userString =(String)sessionValues.get("user");
//		if (userString==null) {
//			return "login";
//		}
		return "success";
	}

}
