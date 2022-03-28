package edu.gdkm.util;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * 页面的分页工具栏
 * 显示格式：首页 上一页 1 2 3 4 5下一页 尾页
 * 分页参数已设置为：当前页码为“page”,每页行数为“rows”
 * 分页链接样式：查询所有时list.action?page=3&rows=10
 *           查询所有时首页尾页样式list.action?page=8
 *           条件查询时list.action?title=天气&newsColumnId=1&page=3&rows=10
 *           条件查询时首页尾页样式list.action?title=天气&newsColumnId=1&page=8
 */
public class NavigationTag extends TagSupport {
	static final long serialVersionUID = 2372405317744358833L;
	/**
	 * request中用于保存Page<E>对象的变量名,默认为“page”,此属性必须有
	 */
	private String bean = "page";
	/**
	 * 分页跳转的url地址,此属性必须有
	 */
	private String url = null;
	/**
	 * 中间位置显示页码数量，此属性必须有
	 */
	private int number = 5;

	
	@Override
	public int doStartTag() throws JspException {
		JspWriter writer = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		Page page = (Page) request.getAttribute(bean);  //获取保存分页数据的page对象
		if (page == null)
			return SKIP_BODY;
		url = resolveUrl(url, pageContext);  //为url添加翻页请求page和rows以外的查询条件参数和参数值
		try {
			// 计算总页数
			int pageCount = page.getTotal() / page.getSize();
			if (page.getTotal() % page.getSize() > 0) {
				pageCount++;
			}
			writer.print("<nav><ul class=\"pagination\">");
			//首页链接路径
			String homeUrl = append(url, "page", 1); 
			//末页链接路径
			String backUrl = append(url, "page", pageCount);
			// 显示“首页，上一页”按钮
			if (page.getPage() > 1) { 
				//当前页码大于1时候，首页和上一页
				String preUrl = append(url, "page", page.getPage() - 1);
				preUrl = append(preUrl, "rows", page.getSize());
				writer.print("<li><a href=\"" + homeUrl + "\">" + "首页</a></li>");
				writer.print("<li><a href=\"" + preUrl + "\">" + "上一页</a></li>");
			} else{
				writer.print("<li class=\"disabled\"><a href=\"#\">" + "首页 </a></li>");
				writer.print("<li class=\"disabled\"><a href=\"#\">" + "上一页 </a></li>");
			}
			//显示中间位置页面，当前页码的前2页码和后2页码
			//总页数<=4：若1 则 1, 若2 则 1 2, 若3 则1 2 3, 若4 则 1 2 3 4, 
			//总页数>=5：若3 则 1 2 3 4 5, 若4则 2 3 4 5 6, 若5则 3 4 5 6 7, 若10 则 8 9 10 11 12
			int indexPage =1;  //中间位置显示的页码
			if(page.getPage() - 2 <=0){ //总页数<=2，则当前页也<=2，中间位置显示的页码从1开始
				indexPage=1;
			}else if(pageCount-page.getPage() <=2){ 
				indexPage=pageCount-4;
				if(indexPage<=0){//总页码为3，4时候，indexPage不能<=0，初始化为1
					indexPage=1;
				}					
			}else{ //总页码数>=5，中间位置显示的页码如上面规则
				indexPage= page.getPage() - 2;
			}			
			for (int i=1;i <= number && indexPage <= pageCount;indexPage++,i++){
				if (indexPage == page.getPage()) { //中间位置显示的页码=当前页码
					writer.print("<li class=\"active\"><a href=\"#\">" + indexPage +"<spanclass=\"sr-only\"></span></a></li>");
					continue;
				}
				String pageUrl = append(url, "page", indexPage);
				pageUrl = append(pageUrl, "rows", page.getSize());
				writer.print("<li><a href=\"" + pageUrl + "\">" + indexPage + "</a></li>");
			}
			// 显示“尾页、下一页”按钮
			if (page.getPage() < pageCount) {
				//当前页码小于总页码，尾页和下一页可用
				String nextUrl = append(url, "page", page.getPage() + 1);
				nextUrl = append(nextUrl, "rows", page.getSize());
				writer.print("<li><a href=\"" + nextUrl + "\">" + "下一页</a></li>");
				writer.print("<li><a href=\"" + backUrl + "\">" + "尾页</a></li>");
			} else {
				writer.print("<li class=\"disabled\"><a href=\"#\">" + "下一页</a></li>");
				writer.print("<li class=\"disabled\"><a href=\"#\">" + "尾页</a></li>");
			}
			writer.print("</nav>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
	/**
	 * 为分页url增加传参参数名key及参数值value
	 */
	private String append(String url, String key, String value) {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		//对搜索的内容生成分页组件时进行重新编码，解决乱码
		if(request.getMethod().toUpperCase()=="GET"){
			try {
				value=new String(value.getBytes("ISO8859-1"),"UTF-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (url == null || url.trim().length() == 0) {
			return "";
		}
		if (url.indexOf("?") == -1) {
			url = url + "?" + key + "=" + value;
		} else {
			if (url.endsWith("?")) {
				url = url + key + "=" + value;
			} else {
				url = url + "&amp;" + key + "=" + value;
			}
		}
		return url;
	}
	
	/**
	 * 为url增加传参参数及参数值
	 */	
	private String append(String url, String key, int value) {
		return append(url, key, String.valueOf(value));
	}
	
	/**
	 * 为url添加翻页请求page和rows以外的参数
	 */
	private String resolveUrl(String url, javax.servlet.jsp.PageContext pageContext) throws JspException {
		Map params = pageContext.getRequest().getParameterMap();
		for (Object key : params.keySet()) {
			if ("page".equals(key) || "rows".equals(key)){
				continue;
			}
			Object value = params.get(key);
			if (value == null){
				continue;
			}
			if (value.getClass().isArray()) {
				url = append(url, key.toString(), ((String[]) value)[0]);
			} else if (value instanceof String) {
				url = append(url, key.toString(), value.toString());
			}
		}
		return url;
	}
	public String getBean() {
		return bean;
	}
	public void setBean(String bean) {
		this.bean = bean;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setNumber(int number) {
		this.number = number;
	}
}    
