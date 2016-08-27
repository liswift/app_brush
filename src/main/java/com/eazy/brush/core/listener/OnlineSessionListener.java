package com.eazy.brush.core.listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.eazy.brush.component.shiro.ShiroContants;

/**
 * 统计系统在线人数的一个小功能
 */
public class OnlineSessionListener implements HttpSessionAttributeListener  {
	
	private OnlineList ol = OnlineList.getInstance();
	 
	/**
	 * 在线人数统计程序存在一些问题，如果用户没有退出登录而直接关闭了浏览器，那么在服务器端的Session中，
	 * 这个用户仍然是存在的，直到Session的超时值发生。所以在线人数统计只能做到在一个时间段内统计出大致的
	 * 在线人数，而不能统计出精确的人数。为了提高统计的精确性，可以在客户端设置脚本，当浏览器关闭时，自动
	 * 向服务器发送一个请求，服务器收到这个请求后，使Session失效。不过，这也不能做到100%的精确，因为还存
	 * 在着客户端的浏览器异常终止，或者客户机器崩溃的可能。
	 */
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		if(arg0.getName().equals((ShiroContants.SESSION_INCREMENT))) {
			ol.addSession();
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		if(arg0.getName().equals(ShiroContants.SESSION_INCALC)) {
			ol.delSession();
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
	}
}
