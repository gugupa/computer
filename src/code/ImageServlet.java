package code;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedImage bImage=new BufferedImage(68, 22, BufferedImage.TYPE_INT_RGB);
		//��ͼ
		Graphics graphics=bImage.getGraphics();
		Color color=new Color(220,150,130);
		graphics.setColor(color);
		//��ͼƬ������
		graphics.fillRect(0, 0, 78, 27);
		
		/**
		 * ��ͼƬ����ʾ������
		 * ��ĸ�����ֵ����
		 */
		char[] ch="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		//�����ȡ���������
		Random random=new  Random();
		int len=ch.length,index;
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<4;i++){
			index=random.nextInt(len);
			graphics.setColor(new Color(random.nextInt(88),random.nextInt(188),random.nextInt(255)));
			graphics.drawString(ch[index]+"",(i*15)+3, 18);
			sb.append(ch[index]);
		}
		//����֤�뱣�浽sessionΪ�Ժ�Ƚ�ʹ��
		request.getSession().setAttribute("piccode", sb.toString());
		ImageIO.write(bImage, "JPG", response.getOutputStream());
		}


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	

}