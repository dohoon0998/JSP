package net.utility;

import java.text.DecimalFormat;

public class Utility {
	public static synchronized String comma(int price) {
	    DecimalFormat comma = new DecimalFormat("###,##0");
	    String cs = comma.format(price);

	    return cs;
	  }
  }
  
