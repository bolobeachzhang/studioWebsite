package cn.edu.cdu.lab.utils;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.rmi.ServerException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthImage extends HttpServlet {
	private static final long serialVersionUID = 8165458985542870320L;
	private Font mFont=new Font("Arial Black",Font.PLAIN,16);

   public Color getRandColor(int fc,int bc){
	   Random random=new Random();
	   if (fc>255) 
		fc=255;

	   if (bc>255) 
	    bc=255;
	   int r=fc+random.nextInt(bc-fc);
  int g=fc+random.nextInt(bc-fc); 
  int b=fc+random.nextInt(bc-fc);
  return new Color(r,g,b);
   }
   public void doGet(HttpServletRequest requset,HttpServletResponse response)throws ServerException,IOException{
	   response.setHeader("Pramgma","No-cache");
	   response.setHeader("Cache-Control","No-cache");
	   response.setDateHeader("Expires",0);
	   response.setContentType("image.jpeg");
	   int width=80;
	   int height=20;
	   BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	   Graphics g=image.getGraphics();
	   Random random=new Random();
	   g.setColor(getRandColor(200, 250));
	   g.fillRect(1, 1, width-1, height-1);
	   g.setColor(new Color(102,102,102));
	   g.drawRect(0, 0, width-1, height-1);
	   g.setFont(mFont);
	   g.setColor(getRandColor(160, 200));
	   for (int i = 0; i < 155; i++) {
		int x=random.nextInt(width-1);
		int y=random.nextInt(height-1);
	    int x1=random.nextInt(6)+1;
	    int y1=random.nextInt(12)+1;
	   }
	   for (int i = 0; i < 155; i++) {
		int x=random.nextInt(width-1);
		int y=random.nextInt(height-1);
		int x1=random.nextInt(12)+1;
		int y1=random.nextInt(6)+1;
		g.drawLine(x, y, x-x1, y-y1);
	}
	   String sRand="";
	  
	   int LEN=4;
	   for (int i = 0; i < LEN; i++) {
		   String tmp=getRandomChar();
		   sRand+=tmp;
		   g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
		   g.drawString(tmp, 15*i+10, 15);
	}
	   HttpSession session=requset.getSession(true);
	
	    session.setAttribute("randomImageStr",sRand.toLowerCase());
	    g.dispose();
	    ImageIO.write(image, "JPEG", response.getOutputStream());
	   
   }

private String getRandomChar(){
	int rand=(int) Math.round(Math.random()*2);
	long itmp=0;
	char ctmp='\u0000';
	switch (rand) {
	case 1:
		itmp=Math.round(Math.random()*25+65);
		ctmp=(char) itmp;
		return String.valueOf(ctmp);
		case 2:
			itmp=Math.round(Math.random()*25+97);
			ctmp=(char)itmp;
			return String.valueOf(ctmp);

	default:
		itmp=Math.round(Math.random()*9);
		return String.valueOf(itmp);
	
	}
}
   }

