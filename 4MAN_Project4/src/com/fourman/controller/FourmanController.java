package com.fourman.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.command.AdminCommand;
import com.fourman.command.AmindOrderDeleteCommand;
import com.fourman.command.AmindOrderListCommand;
import com.fourman.command.AmindOrderSearchCommand;
import com.fourman.command.AmindUserDeleteCommand;
import com.fourman.command.AmindUserSearchCommand;
import com.fourman.command.BestProductCommand;
import com.fourman.command.CartDeleteCommand;
import com.fourman.command.CartListCommand;
import com.fourman.command.DeleteProductCommand;
import com.fourman.command.DetailProductCommand;
import com.fourman.command.FindIdCommand;
import com.fourman.command.FindpwCommand;
import com.fourman.command.ICommand;
import com.fourman.command.IdCheckCommand;
import com.fourman.command.InsertCartCommand;
import com.fourman.command.InsertUserCommand;
import com.fourman.command.InsertOrderCommand;
import com.fourman.command.InsetProductCommand;
import com.fourman.command.LoginCommand;
import com.fourman.command.LogoutCommand;
import com.fourman.command.MainProductCommand;
import com.fourman.command.NewProductCommand;
import com.fourman.command.OrderDetailCommand;
import com.fourman.command.PantsProductCommand;
import com.fourman.command.QnADeleteCommand;
import com.fourman.command.QnADetailViewCommand;
import com.fourman.command.QnAListCommand;
import com.fourman.command.QnAReplyCommand;
import com.fourman.command.QnAUpdateCommand;
import com.fourman.command.QnAUserViewCommand;
import com.fourman.command.QnAWriteCommand;
import com.fourman.command.SearchProductCommand;
import com.fourman.command.SelectProductCommand;
import com.fourman.command.ShoesProductCommand;
import com.fourman.command.TopProductCommand;
import com.fourman.command.UpdateProductCommand;
import com.fourman.command.UpdateProductDBCommand;
import com.fourman.command.UserDropCommand;
import com.fourman.command.UserInfoCommand;
import com.fourman.command.UserListCommand;

/**
 * Servlet implementation class FourmanController
 */
@WebServlet("*.do")
public class FourmanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourmanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
		System.out.println(uri);
		String conPath=request.getContextPath();
		
		String command=uri.substring(conPath.length());
		String viewPage="view.jsp";
		
		ICommand ic=null;
		
		
		if(command.equals("/index.do")) {
			System.out.println("index.do");
			viewPage="index.jsp";
			ic= new MainProductCommand();
			ic.execute(request,response);
		}
			//admin login
		else if(command.equals("/admin.do")) {
			System.out.println("admin.do");
			
			viewPage="/admin/admin.jsp";
			ic= new SelectProductCommand();
			ic.execute(request,response);
		}
		else if(command.equals("/insert_product.do")) {
			System.out.println("insertProduct.do");
			viewPage="/admin/insert_product.jsp";
		}else if(command.equals("/insertProductDB.do")) {
			System.out.println("insertProduct.do");
			viewPage="admin.do";
			ic= new InsetProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/product_search.do")) {
			System.out.println("prdocut_search.do");
			viewPage="/admin/admin.jsp";
			ic= new SearchProductCommand();
			ic.execute(request,response);
			
		}else if(command.equals("/delete_prdouct.do")) {
			System.out.println("delete_prdouct.do");
			viewPage="/admin/admin.jsp";
			ic= new DeleteProductCommand();
			ic.execute(request,response);
		}
		else if(command.equals("/update_prdouct.do")) {
			System.out.println("update_prdouct.do");
			viewPage="/admin/update_prdouct.jsp";
			ic= new UpdateProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/updateproductDB.do")) {
			System.out.println("updateproductDB.do");
			viewPage="/admin/admin.jsp";
			ic= new UpdateProductDBCommand();
			ic.execute(request,response);
		}else if(command.equals("/list_user.do")) {
			System.out.println("list_user.do");
			viewPage="/admin/list_user.jsp";
			ic= new UserListCommand();
			ic.execute(request,response);
		}else if(command.equals("/admin_user_delete.do")) {
			System.out.println("admin_user_delete.do");
			viewPage="list_user.do";
			ic= new AmindUserDeleteCommand();
			ic.execute(request,response);
		}else if(command.equals("/amdin_user_search.do")) {
			System.out.println("amdin_user_search.do");
			viewPage="/admin/list_user.jsp";
			ic= new AmindUserSearchCommand();
			ic.execute(request,response);
		}else if(command.equals("/list_qna.do")) {
			System.out.println("list_qna.do");
			viewPage="/admin/list_qna.jsp";
			ic = new QnAListCommand();
			ic.execute(request,response);
		}else if(command.equals("/admin_qna_delete.do")) {
			System.out.println("admin_qna_delete.do");
			viewPage="list_qna.do";
			ic = new QnADeleteCommand();
			ic.execute(request,response);
		}else if(command.equals("/list_order.do")) {
			System.out.println("list_order.do");
			viewPage="/admin/list_order.jsp";
			ic = new AmindOrderListCommand();
			ic.execute(request,response);
		}else if(command.equals("/admin_orer_delete.do")) {
			System.out.println("admin_orer_delete.do");
			viewPage="list_order.do";
			ic = new AmindOrderDeleteCommand();
			ic.execute(request,response);
		}else if(command.equals("/amdin_order_search.do")) {
			System.out.println("amdin_order_search.do");
			viewPage="list_order.do";
			ic = new AmindOrderSearchCommand();
			ic.execute(request,response);
		}
		//유저 로그인/로그아웃
		//-------------------------------------------------------
		else if(command.equals("/login.do")) {
			viewPage="/login/login.jsp";
		}else if(command.equals("/loginAction.do")) {
			ic = new LoginCommand();
			ic.execute(request, response);
			viewPage="index.jsp";
		}else if(command.equals("/logout.do")) {
			viewPage="index.jsp";
			ic = new LogoutCommand();
			ic.execute(request, response);
		}else if(command.equals("/join.do")) {
				System.out.println("join.do");
				viewPage="/login/join.jsp";
		}else if(command.equals("/idcheckAction.do")) {
			System.out.println("idcheckAction.do");
			viewPage="/login/join.jsp";
			ic = new IdCheckCommand();
			ic.execute(request, response);
	}		
		//유저 회원가입 및 아이디/비밀번호 찾기
		//-------------------------------------------------------
		else if(command.equals("/insert_userDB.do")){
			System.out.println("insert.do");
			viewPage="/login/login.jsp";
			ic=new InsertUserCommand();
			ic.execute(request, response);
		}else if(command.equals("/find_id.do")) {
				System.out.println("find_id.do");
				viewPage="/login/find_id.jsp";
		}else if(command.equals("/find_idVIew.do")) {
			System.out.println("find_idView.do");
			viewPage="/login/findidView.jsp";
			ic = new FindIdCommand();
			ic.execute(request,response);
		}else if(command.equals("/find_pw.do")) {
				System.out.println("find_pw.do");
				viewPage="/login/find_pw.jsp";
		}else if(command.equals("/find_pwView.do")) {
				System.out.println("find_pwView.do");
				viewPage="/login/find_pwView.jsp";
				ic = new FindpwCommand();
				ic.execute(request,response);
		
		}else if(command.equals("/user_update.do")) {
			System.out.println("user_update.do");
			viewPage="/mypage/user_update.jsp";
			ic = new UserInfoCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/mypage_userDelete.do")) {
			viewPage="/mypage/mypage_userDelete.jsp";
		}else if(command.equals("/deleteUserAction.do")) {
			ic = new UserDropCommand();
			ic.execute(request, response);
			viewPage="logout.do";
		}
//		else if(command.equals("/updateAction.do")) {
//			ic = new UpdateCommand();
//			ic.execute(request, response);
//		}		
		//상품페이지
		//-------------------------------------------------------
		else if(command.equals("/best_product.do")) {
			System.out.println("best_product.do");
			viewPage="/product/best_product.jsp";
			ic= new BestProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/detail_product.do")) {
			System.out.println("detail_product.do");
			viewPage="/product/detail_product.jsp";
			ic= new DetailProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/new_product.do")) {
			System.out.println("new_product.do");
			viewPage="/product/new_product.jsp";
			ic= new NewProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/top_product.do")) {
			System.out.println("top_product.do");
			viewPage="/product/top_product.jsp";
			ic= new TopProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/pants_product.do")) {
			System.out.println("pants_product.do");
			viewPage="/product/pants_product.jsp";
			ic= new PantsProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/shoes_product.do")) {
			System.out.println("shoes_product.do");
			viewPage="/product/shoes_product.jsp";
			ic= new ShoesProductCommand();
			ic.execute(request,response);
		}else if(command.equals("/search_product.do")) {
			System.out.println("search_product.do");
			viewPage="/product/search_product.jsp";
			ic= new SearchProductCommand();
			ic.execute(request,response);
		}
		
		//주문페이지
		//-------------------------------------------------------
		else if(command.equals("/order_productAction.do")) {
			System.out.println("order_productAction.do");
			viewPage="/order/order_productAction.jsp";
			ic = new InsertOrderCommand();
			ic.execute(request, response);
		}else if(command.equals("/order_product.do")) {
			System.out.println("order_product.do");
			viewPage="/order/order_product.jsp";
			ic = new OrderDetailCommand();
			ic.execute(request, response);
		}
		//카트
		else if(command.equals("/cartAction.do")) {
			System.out.println("cartAction.do");
			viewPage="/cart/cartAction.jsp";
			ic = new InsertCartCommand();
			ic.execute(request, response);
		}else if(command.equals("/cart.do")) {
			System.out.println("cart.do");
			viewPage="/cart/cart.jsp";
			ic = new CartListCommand();
			ic.execute(request, response);
		}else if(command.equals("/cartDelete.do")) {
			System.out.println("cartDelete.do");
			viewPage="/cart/cart.jsp";
			ic = new CartDeleteCommand();
			ic.execute(request, response);
		}
		
		//게시판(QnA)
		else if(command.equals("/qnalist.do")) {
			System.out.println("qnalist.do");
			viewPage="/QnA/qnalist.jsp";
			ic = new QnAListCommand();
			ic.execute(request, response);
		}else if(command.equals("/qnawrite_view.do")) {
			System.out.println("qnawrite_view.do");
			viewPage="/QnA/qnawrite_view.jsp";
		}else if(command.equals("/qnawrite.do")) {
			System.out.println("qnawrite.do");
			viewPage="qnalist.do";
			ic = new QnAWriteCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/qnauser_view.do")) {
			System.out.println("qnawrite.do");
			viewPage="/QnA/qnauser_view.jsp";
			ic = new QnAUserViewCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/qnadetail_view.do")) {
			System.out.println("qnadetail_view.do");
			viewPage="/QnA/qnadetail_view.jsp";
			ic = new QnADetailViewCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/qna_update_view.do")) {
			System.out.println("qna_update_view.do");
			viewPage="/QnA/qna_update.jsp";
			ic = new QnADetailViewCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/qna_update.do")) {
			System.out.println("qna_update.do");
			viewPage="qnalist.do";
			ic = new QnAUpdateCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/qna_delete.do")) {
			System.out.println("qna_delete.do");
			viewPage="qnalist.do";
			ic = new QnADeleteCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/reply_view.do")) {
			System.out.println("reply_view.do");
			viewPage="/QnA/reply_view.jsp";
			ic = new QnADetailViewCommand();
			ic.execute(request, response);
			
		}else if(command.equals("/reply.do")) {
			System.out.println("reply_view.do");
			
			int currentPageNum = 1;
			int bPageDataCount = 10;
			try {
			currentPageNum=Integer.parseInt(request.getParameter("page"));
			bPageDataCount=Integer.parseInt(request.getParameter("pageDataCount"));
			System.out.println("cont"+currentPageNum);
			System.out.println("cont"+bPageDataCount);
			
			}catch (NumberFormatException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
			viewPage="qnalist.do?page="+currentPageNum
					+"&pageDataCount="+bPageDataCount;
			ic = new QnAReplyCommand();
			ic.execute(request, response);
		}
		
		RequestDispatcher dispatcher=
				request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
