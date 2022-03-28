package edu.gdkm.po;
import java.util.List;
public class News {
	public News() {
	}

	@Override
	public String toString() {
		return "News{" +
				"newsId=" + newsId +
				", newsColumnId=" + newsColumnId +
				", title='" + title + '\'' +
				", account='" + account + '\'' +
				", num=" + num +
				", createTime='" + createTime + '\'' +
				", pic='" + pic + '\'' +
				", appendix='" + appendix + '\'' +
				", video='" + video + '\'' +
				", message='" + message + '\'' +
				", columnName='" + columnName + '\'' +
				'}';
	}

	private Integer newsId;

	private Integer newsColumnId;
	private String title;

	private String account;

	private Integer num;

	private String createTime;

	private String pic;

	private String appendix;

	private String video;

	private String message;

	private String columnName;

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public Integer getNewsId() {
		return newsId;
	}


	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}


	public Integer getNewsColumnId() {
		return newsColumnId;
	}

	public void setNewsColumnId(Integer newsColumnId) {
		this.newsColumnId = newsColumnId;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account == null ? null : account.trim();
	}

	public Integer getNum() {
		return num;
	}


	public void setNum(Integer num) {
		this.num = num;
	}


	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime == null ? null : createTime.trim();
	}


	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic == null ? null : pic.trim();
	}

	public String getAppendix() {
		return appendix;
	}


	public void setAppendix(String appendix) {
		this.appendix = appendix == null ? null : appendix.trim();
	}


	public String getVideo() {
		return video;
	}


	public void setVideo(String video) {
		this.video = video == null ? null : video.trim();
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message == null ? null : message.trim();
	}
}