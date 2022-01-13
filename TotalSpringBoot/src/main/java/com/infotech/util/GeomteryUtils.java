/**
 * 
 */
package com.infotech.util;

import java.sql.SQLException;
import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

//import oracle.jbo.Row;
///import oracle.jbo.domain.Number;


/**
 * Utility routines.
 *
 * @author Steve Muench
 * $Id: Utils.java,v 1.3 2008/05/13 06:05:26 servis Exp $
 */
public class GeomteryUtils {
  private static final String COMMA = ",";
  private static final String QUOTE = "'";
  public static final String HEPSI_IDENTIFIER = "Hepsi";
  public static final String GRUPSUZ_IDENTIFIER = "GRUPSUZ";
  public static final int TICKET_LOGIN_TYPE = 2;
  public static final int NORMAL_LOGIN_TYPE = 1;
  public static final int TICKET_EXPIRE_INTERVAL_AS_SECOND = 600;
  public static final int MPS_PRIVILEGE_NUMBER = 4;
  public static final int EXTERNAL_MPS_PRIVILEGE_NUMBER = 41;
  public static final int TRIAL_MPS_PRIVILEGE_NUMBER = 42;
  public static String TURKEY_PHONE_CODE = "90";

  /**
   * Clone a list.
   * @param original Original list to be cloned
   * @return cloned list
   */
  public static List cloneList(List original) {
    List clonedList = new ArrayList();
    for (Object o: original) {
      clonedList.add(o);
    }
    return clonedList;
  }

  /**
   * Returns a String-array as a comma separate list of values.
   * @param values String values to comma-ify into a single string
   * @return String containing strings in array passed in separated by commas
   */
  public static String commaSeparatedListOfValues(String[] values) {
    return commaSeparatedListOfValues(values, false);
  }

  /**
   * Returns a String-array as a comma-separated list of values, optionally
   * quoted by an apostrophe.
   * 
   * @param values String values to comma-ify into a single string
   * @param quoted flag determining whether to quote the values or not
   * @return String containing strings in array passed in separated by commas
   */
  public static String commaSeparatedListOfValues(String[] values, boolean quoted) {
    if (values == null)
      return null;
    int len = values.length;
    if (len == 0)
      return null;
    StringBuffer sb = new StringBuffer();
    boolean alreadyDidOne = false;
    for (int q = 0; q < len; q++) {
      String curValue = values[q];
      if (curValue != null && !curValue.equals("")) {
        if (alreadyDidOne) {
          sb.append(COMMA);
        }
        alreadyDidOne = true;
        if (quoted)
          sb.append(QUOTE);
        sb.append(values[q]);
        if (quoted)
          sb.append(QUOTE);
      }
    }
    return sb.toString();
  }
/*
 
  public static Number intToNumber(Integer i) {
    try {
      return new Number(i);
    } catch (SQLException sx) {
      return null;
    }
  }

  public static String getSafeStringParameter(Row row, String attrName) {
    if (row.getAttributeIndexOf(attrName) < 0)
      return "";
    if (row.getAttribute(attrName) == null)
      return "";
    else
      return row.getAttribute(attrName).toString();
  }

  public static int getSafeIntParameter(Row row, String attrName) {
    if (row.getAttributeIndexOf(attrName) < 0)
      return -1;
    if (row.getAttribute(attrName) == null)
      return -1;
    else
      return Integer.parseInt(row.getAttribute(attrName).toString());
  }

  public static long getSafeLongParameter(Row row, String attrName) {
    if (row.getAttributeIndexOf(attrName) < 0)
      return -1;
    if (row.getAttribute(attrName) == null)
      return -1;
    else
      return Long.parseLong(row.getAttribute(attrName).toString());
  }

  public static double getSafeDoubleParameter(Row row, String attrName) {
    if (row.getAttributeIndexOf(attrName) < 0)
      return -1;
    if (row.getAttribute(attrName) == null)
      return -1;
    else
      return Double.parseDouble(row.getAttribute(attrName).toString());
  }

  public static java.util.Date getSafeDateParameter(Row row, String attrName) {
    if (row.getAttributeIndexOf(attrName) < 0)
      return null;
    if (row.getAttribute(attrName) == null)
      return null;
    else {
      oracle.jbo.domain.Date dummy = (oracle.jbo.domain.Date)row.getAttribute(attrName);
      return dummy.getValue();
    }
  }

*/
  public static String getFormattedDateValue(Date date, String format) {
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    return sdf.format(date);
  }

  public static Timestamp getCurrentTime() {
    Calendar c = Calendar.getInstance();
    Timestamp ts = new Timestamp(c.getTime().getTime());
    return ts;
  }

  public static int getRandomNumber(int floor, int ceil) {
    Random rand = new Random();
    int num = rand.nextInt(ceil) + floor;
    return num;
  }
}
