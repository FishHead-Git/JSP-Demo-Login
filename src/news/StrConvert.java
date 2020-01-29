package news;

import java.io.UnsupportedEncodingException;

public class StrConvert {
	public StrConvert() {
		// TODO Auto-generated constructor stub
		
	}
	
	public String chStr(String str) {
		if(str == null) {
			return "";
		}else {
			try {
				str = new String(str.getBytes("iso-8859-1"), "GB2312").trim();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return str;
		}
	}
}
