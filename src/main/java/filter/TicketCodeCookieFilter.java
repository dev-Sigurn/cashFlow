package filter;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.AvatarDao;
import model.dao.KeepTicketDao;
import model.dao.UserDao;
import model.vo.Avatar;
import model.vo.KeepTicket;
import model.vo.User;

@WebFilter({ "/*" })
public class TicketCodeCookieFilter extends HttpFilter {
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 쿠키가 있다면 전처리 후
		// 이 요청에 ticketCode 쿠키가 있는지를 확인.
		Cookie found = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie one : cookies) {
				if (one.getName().equals("ticketCode")) {
					found = one;
					break;
				}
			}
		}
		// ========================================================
		// 있으면, 값 찾아서 유저 찾고 세션에 올려서 통과
		if (found != null) {
			String code = found.getValue();
			KeepTicketDao keepTicketDao = new KeepTicketDao();
			try {
				KeepTicket foundTicket = keepTicketDao.findByCode(code);
				Date now = new Date(System.currentTimeMillis());
				
				if(foundTicket != null && foundTicket.getExpiredAt().before(now)) {
					String userId = foundTicket.getUserId();
					UserDao userDao = new UserDao();
					User foundUser = userDao.findById(userId);
					AvatarDao avatarDao = new AvatarDao();
					Avatar foundAvatar = avatarDao.findById(foundUser.getAvatarId());
					
					
					request.getSession().setAttribute("logonUser", foundUser);
					request.getSession().setAttribute("logonUserAvatar", foundAvatar);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// 100% 통과를 시키는 필터
		chain.doFilter(request, response);
	}
}
